require "benchmark/ips"

total_posts = 1000
total_tags = 100
total_tags_per_post = 10
total_users = 10

total_posts_per_user = total_posts / total_users

tags = []
total_tags.times { |i| tags << "tag#{i}" }
tags += tags.first(total_tags_per_post)

def create_tags(i, count)
  tags = []
  count.times do |j|
    tags << "tag#{i + j}"
  end
  tags
end

namespace :benchmark do
  task create: :environment do
    [ User, Post, TagArrayPost, PgPost, ActsAsTaggableOn::Tagging, ActsAsTaggableOn::Tag ].each do |model|
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{model.table_name} RESTART IDENTITY CASCADE;")
    end

    users = []
    total_users.times do |i|
      users << User.create(name: "u#{i}")
    end

    Benchmark.ips do |x|
      x.config(warmup: 0)
      x.report("acts-as-taggable-on") do
        total_posts.times do |i|
          user = users[i / total_posts_per_user]
          tag_index = i % total_tags
          post = Post.create(title: "p#{i}", user: user)
          user.tag(post, with: tags[tag_index...(tag_index + total_tags_per_post)], on: :tags)
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_posts.times do |i|
          user_id = i / total_posts_per_user + 1
          tag_index = i % total_tags
          TagArrayPost.create(title: "p#{i}", user_id: user_id, tags: tags[tag_index...(tag_index + total_tags_per_post)])
        end
      end
      x.report("pg_taggable") do
        total_posts.times do |i|
          user_id = i / total_posts_per_user + 1
          tag_index = i % total_tags
          PgPost.create(title: "p#{i}", user_id: user_id, tags: tags[tag_index...(tag_index + total_tags_per_post)])
        end
      end
    end
  end

  task as_json: :environment do
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        10.times do
          total_users.times do |i|
            Post.where(user_id: i + 1).includes(taggings: :tag)
              .as_json(
                only: %i[id title],
                methods: %i[all_tags_list]
              )
          end
        end
      end
      x.report("acts-as-taggable-array-on") do
        10.times do
          total_users.times do |i|
            TagArrayPost.where(user_id: i + 1).as_json(only: %i[id title tags])
          end
        end
      end
      x.report("pg_taggable") do
        10.times do
          total_users.times do |i|
            PgPost.where(user_id: i + 1).as_json(only: %i[id title tags])
          end
        end
      end
    end
  end

  task owned_tags: :environment do
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        10.times do
          total_users.times do |i|
            User.find(i + 1).owned_tags.select(:name).pluck(:name)
          end
        end
      end
      x.report("acts-as-taggable-array-on") do
        10.times do
          total_users.times do |i|
            TagArrayPost.all_tags { where(user_id: i + 1) }
          end
        end
      end
      x.report("pg_taggable") do
        10.times do
          total_users.times do |i|
            PgPost.where(user_id: i + 1).uniq_tags
          end
        end
      end
    end
  end

  task count: :environment do
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        10.times do
          total_users.times do |i|
            Post.where(user_id: i + 1).tag_counts_on(:tags).map { |r| [ r.name, r.count ] }.to_h
          end
        end
      end
      x.report("acts-as-taggable-array-on") do
        10.times do
          total_users.times do |i|
            TagArrayPost.tags_cloud { where(user_id: i + 1) }
          end
        end
      end
      x.report("pg_taggable") do
        10.times do
          total_users.times do |i|
            PgPost.where(user_id: i + 1).count_tags
          end
        end
      end
    end
  end

  task :all_tags, [ :tag_count ] => :environment do |task, args|
    count = args.tag_count.to_i
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        total_tags.times do |i|
          Post.tagged_with(create_tags(i, count), on: :tags).ids
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_tags.times do |i|
          TagArrayPost.with_all_tags(create_tags(i, count)).ids
        end
      end
      x.report("pg_taggable") do
        total_tags.times do |i|
          PgPost.where(all_tags: create_tags(i, count)).ids
        end
      end
    end
  end

  task :any_tags, [ :tag_count ] => :environment do |task, args|
    count = args.tag_count.to_i
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        total_tags.times do |i|
          Post.tagged_with(create_tags(i, count), on: :tags, any: true).ids
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_tags.times do |i|
          TagArrayPost.with_any_tags(create_tags(i, count)).ids
        end
      end
      x.report("pg_taggable") do
        total_tags.times do |i|
          PgPost.where(any_tags: create_tags(i, count)).ids
        end
      end
    end
  end

  task :exclude_tags, [ :tag_count ] => :environment do |task, args|
    count = args.tag_count.to_i
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        total_tags.times do |i|
          Post.tagged_with(create_tags(i, count), on: :tags, exclude: true).ids
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_tags.times do |i|
          TagArrayPost.without_any_tags(create_tags(i, count)).ids
        end
      end
      x.report("pg_taggable") do
        total_tags.times do |i|
          PgPost.where.not(any_tags: create_tags(i, count)).ids
        end
      end
    end
  end

  task :match_all_tags, [ :tag_count ] => :environment do |task, args|
    count = args.tag_count.to_i
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        total_tags.times do |i|
          Post.tagged_with(create_tags(i, count), on: :tags, match_all: true).ids
        end
      end
      x.report("pg_taggable") do
        total_tags.times do |i|
          PgPost.where(tags_eq: create_tags(i, count)).ids
        end
      end
    end
  end

  task like: :environment do |task, args|
    Benchmark.ips do |x|
      x.report("acts-as-taggable-on") do
        100.times do |i|
          Post.tagged_with([ "tag#{i % 10}%" ], on: :tags, any: true, wild: :suffix).ids
        end
      end
      x.report("acts-as-taggable-array-on") do
        100.times do |i|
          tags = TagArrayPost.all_tags.select { |t| t.start_with?("tag#{i % 10}") }
          TagArrayPost.with_any_tags(tags).ids
        end
      end
      x.report("pg_taggable") do
        100.times do |i|
          tags = PgPost.tags.where("tag LIKE ?", "tag#{i % 10}%").distinct.pluck(:tag)
          PgPost.where(any_tags: tags).ids
        end
      end
    end
  end

  task all: :environment do
    puts "---------------------------------"
    %w[create as_json owned_tags count like].each do |sub_task|
      task = "benchmark:#{sub_task}"
      puts task
      Rake::Task[task].invoke
      puts "---------------------------------"
    end

    %w[all_tags any_tags exclude_tags match_all_tags].each do |sub_task|
      [ 1, 5, 10 ].each do |i|
        task = "benchmark:#{sub_task}"
        puts "#{task}[#{i}]"
        Rake::Task[task].invoke(i)
        Rake::Task[task].reenable
        puts "---------------------------------"
      end
    end
  end
end

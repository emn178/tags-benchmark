require "benchmark"

total_posts = 1000
total_tags = 100
total_tags_per_post = 10
total_users = 10

total_posts_per_user = total_posts / total_users

tags = []
total_tags.times { |i| tags << "tag#{i}" }
tags += tags.first(total_tags_per_post)

namespace :benchmark do
  task create: :environment do
    [ User, Post, TagArrayPost, PgPost, ActsAsTaggableOn::Tagging, ActsAsTaggableOn::Tag ].each do |model|
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{model.table_name} RESTART IDENTITY CASCADE;")
    end

    users = []
    total_users.times do |i|
      users << User.create(name: "u#{i}")
    end

    Benchmark.bm do |x|
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

  task list: :environment do
    Benchmark.bm do |x|
      x.report("acts-as-taggable-on") do
        total_users.times do |i|
          Post.where(user_id: i + 1).includes(taggings: :tag)
            .as_json(
              only: %i[id title],
              methods: %i[all_tags_list]
            )
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_users.times do |i|
          TagArrayPost.where(user_id: i + 1).as_json(only: %i[id title tags])
        end
      end
      x.report("pg_taggable") do
        total_users.times do |i|
          PgPost.where(user_id: i + 1).as_json(only: %i[id title tags])
        end
      end
    end
  end

  task ownership: :environment do
    Benchmark.bm do |x|
      x.report("acts-as-taggable-on") do
        total_users.times do |i|
          User.find(i + 1).owned_tags.select(:name).pluck(:name)
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_users.times do |i|
          TagArrayPost.all_tags { where(user_id: i + 1) }
        end
      end
      x.report("pg_taggable") do
        total_users.times do |i|
          PgPost.where(user_id: i + 1).uniq_tags
        end
      end
    end
  end

  task find_by_tag: :environment do
    Benchmark.bm do |x|
      x.report("acts-as-taggable-on") do
        total_tags.times do |i|
          Post.tagged_with([ "tag#{i}" ], on: :tags).ids
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_tags.times do |i|
          TagArrayPost.with_any_tags([ "tag#{i}" ]).ids
        end
      end
      x.report("pg_taggable") do
        total_tags.times do |i|
          PgPost.where(any_tags: [ "tag#{i}" ]).ids
        end
      end
    end
  end

  task count: :environment do
    Benchmark.bm do |x|
      x.report("acts-as-taggable-on") do
        total_users.times do |i|
          Post.where(user_id: i + 1).tag_counts_on(:tags).map { |r| [ r.name, r.count ] }.to_h
        end
      end
      x.report("acts-as-taggable-array-on") do
        total_users.times do |i|
          TagArrayPost.tags_cloud { where(user_id: i + 1) }
        end
      end
      x.report("pg_taggable") do
        total_users.times do |i|
          PgPost.where(user_id: i + 1).count_tags
        end
      end
    end
  end

  task all: :environment do
    puts "---------------------------------"
    %w[create list ownership find_by_tag count].each do |sub_task|
      task = "benchmark:#{sub_task}"
      puts task
      Rake::Task[task].invoke
      puts "---------------------------------"
    end
  end
end

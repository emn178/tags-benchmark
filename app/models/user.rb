class User < ApplicationRecord
  has_many :posts
  has_many :tag_array_posts

  acts_as_tagger
end

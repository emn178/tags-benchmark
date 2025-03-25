class Post < ApplicationRecord
  belongs_to :user

  acts_as_taggable_on :tags
  acts_as_taggable_tenant :user_id
end

class TagArrayPost < ApplicationRecord
  belongs_to :user

  taggable_array :tags
end

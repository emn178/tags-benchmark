class PgPost < ApplicationRecord
  belongs_to :user

  taggable :tags
end

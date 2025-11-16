class Like < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  validates_uniqueness_of :blog_id, scope: :user_id
end

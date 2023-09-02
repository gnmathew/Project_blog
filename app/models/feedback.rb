class Feedback < ApplicationRecord
  validates :comment, presence: true

  belongs_to :user
  belongs_to :blog_post
end

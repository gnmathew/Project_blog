class BlogPost < ApplicationRecord
  validates :title, :content, :user, presence: true

  belongs_to :user
  has_many :feedbacks
end

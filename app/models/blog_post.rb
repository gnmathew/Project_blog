class BlogPost < ApplicationRecord
  validates :title, :content, :user, presence: true

  belongs_to :user
end

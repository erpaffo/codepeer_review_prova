# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :snippet

  validates :content, presence: true
end

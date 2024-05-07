class Snippet < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :code, presence: true
end

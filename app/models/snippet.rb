class Snippet < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :code, presence: true
end

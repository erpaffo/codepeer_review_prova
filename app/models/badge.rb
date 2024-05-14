# app/models/badge.rb
class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end

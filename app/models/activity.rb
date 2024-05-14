# app/models/activity.rb
class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  validates :action, presence: true
end

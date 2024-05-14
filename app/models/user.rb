# app/models/user.rb
class User < ApplicationRecord
       devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

       has_many :projects
       has_many :snippets
       has_many :comments
       has_many :reviews
       has_many :activities
       has_and_belongs_to_many :badges

       enum role: { student: 0, teacher: 1, admin: 2 }

       after_initialize :set_default_role, if: :new_record?

       private

       def set_default_role
         self.role ||= :student
       end
     end

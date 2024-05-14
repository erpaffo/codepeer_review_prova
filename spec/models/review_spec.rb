require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:snippet) }
  it { should validate_presence_of(:rating) }
  it { should validate_inclusion_of(:rating).in_range(1..5) }
  it { should validate_presence_of(:comment) }
end

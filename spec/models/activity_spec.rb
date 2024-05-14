require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:trackable) }
  it { should validate_presence_of(:action) }
end

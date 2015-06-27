require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:order) }
  it { should have_many(:products) }
end

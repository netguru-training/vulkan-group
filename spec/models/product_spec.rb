require "rails_helper"

RSpec.describe Product, :type => :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:stock) }

  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:stock) }

  it { should belong_to(:category) }

end

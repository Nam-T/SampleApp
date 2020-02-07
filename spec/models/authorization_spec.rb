require "rails_helper"
RSpec.describe User, :type => :model do
  before(:all) do
    @user = create(:user)
    @auth = create(:authorization)
  end

  after(:all) do
    @user.destroy
  end
      
  it "is valid with valid attributes" do
    expect(@auth).to be_valid
  end

  it "is invalid without a uid" do
    FactoryBot.build(:authorization, uid: nil).should_not be_valid
  end

end

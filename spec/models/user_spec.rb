require "rails_helper"
RSpec.describe User, :type => :model do
  before(:all) do
    @user = create(:user)
    @micropost = create(:micropost)
  end

  after(:all) do
    @micropost.destroy
    @user.destroy
  end
          
  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end
  
  it "associated comments should be destroyed" do
    @user.save
    @user.comments.create!(content: "My String", micropost_id: @micropost.id)
    expect { @user.destroy }.to change(Comment, :count).by(-1)
  end
end

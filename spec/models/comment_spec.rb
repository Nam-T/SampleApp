require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = create(:user)
    @micropost = create(:micropost)
    @comment = create(:comment)
    @reply = @comment.replies.build(user_id:@user.id, micropost_id:@micropost.id, content:"My String")
  end

  after(:all) do
    @user.destroy
    @micropost.destroy
  end

  it "is valid with valid attributes" do
    expect(@comment).to be_valid
  end

  it "is invalid without a user_id" do
    FactoryBot.build(:comment, user_id: nil).should_not be_valid
  end

  it "is invalid without a micropost_id" do
    FactoryBot.build(:comment, micropost_id: nil).should_not be_valid
  end

  it "is invalid without a content" do
    FactoryBot.build(:comment, content: nil).should_not be_valid
  end

  it "comment and reply" do
    expect(@comment.replies.first).to equal(@reply)
  end
end

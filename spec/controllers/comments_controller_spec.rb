require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    before(:each) do
      user = create(:user)
      micropost = create(:micropost)
      session[:user_id] = user.id
    end
    context "with valid attributes" do
      it "saves the new comment in the database" do
        expect{
          post :create, params: {comment: FactoryBot.attributes_for(:comment)}
        }.to change(Comment,:count).by(1)
      end
      it "redirects to the home page" do
        post :create, params: {comment: FactoryBot.attributes_for(:comment)}
        expect(response).to redirect_to root_url
      end
    end
        
    context "with invalid attributes" do
      it "does not save the new comment in the database" do
        expect{
          post :create, params: {comment: FactoryBot.attributes_for(:invalid_comment)}
        }.to_not change(Comment,:count)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroy comment in database" do
      user = create(:user)
      micropost = create(:micropost)
      session[:user_id] = user.id
      post :create, params: {comment: FactoryBot.attributes_for(:comment)}
      expect{
        delete :destroy, params: {id: micropost.comments.first.id}
      }.to change(Comment,:count).by(-1)
    end
  end

  describe 'PUT update' do
    before :each do
      user = create(:user)
      micropost = create(:micropost)
      session[:user_id] = user.id
      @comment = create(:comment, content: "first string")
    end
    
    context "valid attributes" do
      it "located the requested @comment" do
        put :update, params: {id: @comment.id, comment:FactoryBot.attributes_for(:comment)}
        expect(assigns(:comment)).to eq(@comment)      
      end
    
      it "changes @comment's attributes" do
        put :update, params: {id: @comment.id, comment:FactoryBot.attributes_for(:comment, content: "update string")}
        @comment.reload
        @comment.content.should eq("update string")
      end
    
      it "redirects to the updated comment" do
        put :update, params: {id: @comment.id, comment:FactoryBot.attributes_for(:comment)}
        expect(response).to redirect_to root_url
      end
    end
    
    context "invalid attributes" do
      it "locates the requested @comment" do
        put :update, params: {id: @comment.id, comment:FactoryBot.attributes_for(:invalid_comment)}
        expect(assigns(:comment)).to eq(@comment)      
      end
      
      it "does not change @comment's attributes" do
        put :update, params: {id: @comment.id, comment:FactoryBot.attributes_for(:comment, content:nil)}
        @comment.reload
        @comment.content.should_not eq(nil)
      end
    end
  end
end

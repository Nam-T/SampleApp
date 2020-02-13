class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create,:edit,:update ,:destroy]
  before_action :correct_user,   only: [:destroy, :edit, :update]

  def create
    @comment = current_user.comments.build(comment_params)
    @micropost = Micropost.find_by(id: params[:comment][:micropost_id])
    @comment.save
    respond
  end

  def edit
    @micropost = @comment.micropost
    respond
  end

  def update
    comment_params = update_comment_params
    @comment.update_attributes(comment_params) if !comment_params[:content].empty?
    respond
  end

  def destroy
    @comment_id = @comment.id
    @micropost = @comment.micropost
    @comment.destroy
    respond
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :picture, :micropost_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      @user = current_user
      redirect_to root_url if @comment.nil?
    end

    def update_comment_params
      params.require(:comment).permit(:content,:picture)
    end

    def respond
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js {}
      end
    end
end

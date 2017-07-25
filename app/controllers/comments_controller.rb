class CommentsController < ApplicationController
  before_action :set_resource, only: [:index, :new, :create]

  def index
  end

  def new
    @comment = @resource.comments.build
  end

  def create
    @comment = @resource.comments.build(comment_params)
    @comment.user = current_user
    if @resource.save
      redirect_to resource_path(@resource)
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to resource_path(@resource)
    end
  end

  def edit
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @resource = @comment.resource
    @comment.destroy if correct_user?
    redirect_to resource_path(@resource)
  end

  private

    def set_resource
      @resource = Resource.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

end

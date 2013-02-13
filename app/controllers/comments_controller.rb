class CommentsController < ApplicationController
  respond_to :html, :js
  
  polymorphic_parent :element, :branch, :star, :pillar, :star_palace, :chart_palace, :star_relationship, authorize_parent: true

  before_filter :load_comment, :only => [:show, :edit, :update, :destroy]
  helper_method :comments

  def index
    @comments = comments
    respond_with @comments
  end
  
  def new
    @comment = comments.build
    respond_with @comment
  end
  
  def create
    @comment = comments.build(params[:comment])
    @comment.save
    
    respond_with @comment do |format|
      format.html {redirect_to parent_url}
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
    respond_with(@comment)
  end
  
  def edit
    @comment = Comment.find(params[:id])
    respond_with(@comment)
  end
  
  def update
    @comment.update_attributes params[:comment]
    respond_with @comment do |format|
      format.html {redirect_to parent_url}
    end
  end
  
  def destroy
    @comment.destroy
    respond_with @comment do |format|
      format.html {redirect_to (request.env['HTTP_REFERER'] || parent_url)}
    end
  end
    
  def load_comment
    @comment = Comment.find(params[:id])
  end
  
  def comments
    Comment.where(commentable_id: parent.id, commentable_type: parent.class.name, member_id: current_member.id)
  end
end

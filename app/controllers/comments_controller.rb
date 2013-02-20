class CommentsController < ApplicationController
  respond_to :html, :js
  
  COMMENTABLE_CLASSES = [:element, :branch, :star, :pillar, :star_palace, :chart_palace, :star_relationship]
  
  before_filter :load_parent, only: [:new, :index]

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
    @comment = comments.build
    @comment.comments = params[:comment]['comments']
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
    @comment.comments = params[:comment]['comments']
    @comment.save
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
  
  def load_parent
    COMMENTABLE_CLASSES.each do |class_name|
      parameter = "#{class_name}_id".to_sym
      if params.include? parameter
        id = params[parameter]
        @parent = class_name.camelize.constantize.find(id)
        instance_variable_set("@#{class_name}", @parent)
        break
      end
    end
    raise "Could not find parent. !!  Oopsie daisies."
  end
  
  def comments
    Comment.where(commentable_id: parent.id, commentable_type: parent.class.name, member_id: current_member.id)
  end
end

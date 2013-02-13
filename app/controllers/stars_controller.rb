class StarsController < ApplicationController
  # GET /stars
  # GET /stars.xml
  def index
    @stars = Star.all
    respond_with(@stars)
  end

  # GET /stars/1
  # GET /stars/1.xml
  def show
    @star = Star.find(params[:id])
    respond_with(@star)
    @comments = comments
    @new_comment = comments.build
  end

  # GET /stars/new
  # GET /stars/new.xml
  def new
    @star = Star.new
    respond_with(@star)
  end

  # GET /stars/1/edit
  def edit
    @star = Star.find(params[:id])
  end

  # POST /stars
  # POST /stars.xml
  def create
    @star = Star.new(params[:star])
    flash[:notice] = 'Star was successfully created.' if @star.save
    respond_with(@star)
  end

  # PUT /stars/1
  # PUT /stars/1.xml
  def update
    @star = Star.find(params[:id])
    flash[:notice] = 'Star was successfully updated.' if @star.update(params[:star])
    respond_with(@star)
  end

  # DELETE /stars/1
  # DELETE /stars/1.xml
  def destroy
    @star = Star.find(params[:id])
    @star.destroy
    respond_with(@star)
  end
  def comments
    Comment.where(member_id: current_member.id, commentable_id: resource.id, commentable_type: 'Star')
  end
end

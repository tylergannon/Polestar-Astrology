class ElementsController < ApplicationController
  # GET /elements
  # GET /elements.xml
  def index
    @elements = Element.all
    respond_with(@elements)
  end

  # GET /elements/1
  # GET /elements/1.xml
  def show
    @comments = comments
    @new_comment = comments.build
    @element = Element.find(params[:id])
    respond_with(@element)
  end

  # GET /elements/new
  # GET /elements/new.xml
  def new
    @element = Element.new
    respond_with(@element)
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id])
  end

  # POST /elements
  # POST /elements.xml
  def create
    @element = Element.new(params[:element])
    flash[:notice] = 'Element was successfully created.' if @element.save
    respond_with(@element)
  end

  # PUT /elements/1
  # PUT /elements/1.xml
  def update
    @element = Element.find(params[:id])
    flash[:notice] = 'Element was successfully updated.' if @element.update(params[:element])
    respond_with(@element)
  end

  # DELETE /elements/1
  # DELETE /elements/1.xml
  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    respond_with(@element)
  end

  def comments
    Comment.where(member_id: current_member.id, commentable_id: resource.id, commentable_type: 'Star')
  end

end

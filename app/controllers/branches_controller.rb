class BranchesController < ApplicationController
  # GET /branches
  # GET /branches.xml
  def index
    @branches = Branch.all
    respond_with(@branches)
  end

  # GET /branches/1
  # GET /branches/1.xml
  def show
    @branch = Branch.find(params[:id])
    @comments = comments
    @new_comment = comments.build
    @branch = Branch.find(params[:id])
    respond_with(@branch)
  end
  
  def comments
    Comment.where(member_id: current_member.id, commentable_id: resource.id, commentable_type: 'Star')
  end


  # GET /branches/new
  # GET /branches/new.xml
  def new
    @branch = Branch.new
    respond_with(@branch)
  end

  # GET /branches/1/edit
  def edit
    @branch = Branch.find(params[:id])
  end

  # POST /branches
  # POST /branches.xml
  def create
    @branch = Branch.new(params[:branch])
    flash[:notice] = 'Branch was successfully created.' if @branch.save
    respond_with(@branch)
  end

  # PUT /branches/1
  # PUT /branches/1.xml
  def update
    @branch = Branch.find(params[:id])
    flash[:notice] = 'Branch was successfully updated.' if @branch.update(params[:branch])
    respond_with(@branch)
  end

  # DELETE /branches/1
  # DELETE /branches/1.xml
  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    respond_with(@branch)
  end
end

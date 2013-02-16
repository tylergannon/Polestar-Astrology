class PillarsController < ApplicationController
  respond_to :html, :js
  # GET /pillars
  # GET /pillars.xml
  def index
    @pillars = Pillar.all
    respond_with(@pillars)
  end

  # GET /pillars/1
  # GET /pillars/1.xml
  def show
    @pillar = Pillar.find(params[:id])
    
    @comments = comments
    @new_comment = comments.build
    @by_year = current_member.people.select{|person| person.chart.year == resource}
    @by_hour = current_member.people.select{|person| person.chart.hour == resource}
    
    respond_with(@pillar)
  end

  # GET /pillars/new
  # GET /pillars/new.xml
  def new
    @pillar = Pillar.new
    respond_with(@pillar)
  end

  # GET /pillars/1/edit
  def edit
    @pillar = Pillar.find(params[:id])
  end

  # POST /pillars
  # POST /pillars.xml
  def create
    @pillar = Pillar.new(params[:pillar])
    flash[:notice] = 'Pillar was successfully created.' if @pillar.save
    respond_with(@pillar)
  end

  # PUT /pillars/1
  # PUT /pillars/1.xml
  def update
    @pillar = Pillar.find(params[:id])
    flash[:notice] = 'Pillar was successfully updated.' if @pillar.update(params[:pillar])
    respond_with(@pillar)
  end

  # DELETE /pillars/1
  # DELETE /pillars/1.xml
  def destroy
    @pillar = Pillar.find(params[:id])
    @pillar.destroy
    respond_with(@pillar)
  end
  def comments
    current_member.id
    resource.id
    Comment.where(member_id: current_member.id, commentable_id: resource.id, commentable_type: 'Pillar')
  end
end

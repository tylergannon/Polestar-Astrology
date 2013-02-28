class StarRelationshipsController < ApplicationController
  respond_to :html, :js
  before_filter :load_chart_palace
  load_and_authorize_resource :palace
  load_and_authorize_resource :star_relationship, :through => :palace
  
  def index
  end
  
  def new
  end
  
  def show
  end
  
  def create    
    @star_relationship = StarRelationship.create palace: @palace, member: current_member
    if params[:all]
      params[:all].reject{|t| t.blank?}.uniq.each do |name, val|
        StarRelationshipStar.create star_relationship: @star_relationship, star: Star.find(name), required: true, member_id: current_member.id, palace_id: @palace.id
      end
    end
    
    if params[:any]
      params[:any].reject{|t| t.blank?}.uniq.each do |name, val|
        StarRelationshipStar.create star_relationship: @star_relationship, star: Star.find(name), required: false, member_id: current_member.id, palace_id: @palace.id
      end
    end
    
    @star_relationship.comments.create(comments: '')
    
    @star_relationship.reload
    parent.reload
    
    respond_with(parent, @star_relationship) do |format|
      format.html {
        redirect_to parent
      }
    end
  end
  
  def edit
  end
  
  def sort
    
  end
  
  def update
    @star_relationship.star_relationship_stars.destroy_all
    params[:all].each do |name, val|
      StarRelationshipStar.create star_relationship: @star_relationship, star: Star.find(name), required: true, member_id: current_member.id, palace_id: @palace.id
    end
    
    if params[:any]
      params[:any].each do |name, val|
        StarRelationshipStar.create star_relationship: @star_relationship, star: Star.find(name), required: false, member_id: current_member.id, palace_id: @palace.id
      end
    end
    
    respond_to do |format|
      format.html {
        redirect_to palace_path(@palace)
      }
    end
  end
  
  def destroy
    @star_relationship.destroy
    respond_to do |format|
      format.html {
        redirect_to @palace
      }
      format.js {
        render action: :destroy
      }
    end
  end
  
  def parent
    @chart_palace || @palace
  end
  
  def load_chart_palace
    if params[:chart_palace_id]
      @chart_palace = ChartPalace.find(params[:chart_palace_id])
      @palace = @chart_palace.palace
    end
  end
end

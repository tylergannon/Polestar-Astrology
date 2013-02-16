class PalacesController < ApplicationController
  load_and_authorize_resource

  def index
  end
  
  def show
    @palace = Palace.find(params[:id])

    @star_relationships = @palace.star_relationships.by_member(current_member)
    if params[:star_id]
      @star = Star.find(params[:star_id])

      @star_relationships = @star_relationships.select{|relationship|
        !relationship.star_relationship_stars.select{|t| t.star == @star}.empty?
      }
    end
  end
end

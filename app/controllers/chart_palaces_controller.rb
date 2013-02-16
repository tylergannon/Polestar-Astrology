class ChartPalacesController < ApplicationController
  respond_to :js, :html
  def show
    @person = Person.find(params[:person_id])
    @chart = @person.chart
    @palace = Palace.find(params[:id])
    @chart_palace = @chart.palaces.by_palace(@palace)
    
    @star_relationships = @chart_palace.my_star_relationships(current_member)
  end
end

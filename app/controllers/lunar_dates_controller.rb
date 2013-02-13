class LunarDatesController < ApplicationController
  respond_to :json
  
  def show
    date = DateTime.parse(params[:id])
    four_pillars = LunarDate.from_date_time(date)
    respond_with(four_pillars) do |format|
      format.json {
        render text: JSON.generate(four_pillars.as_json) 
      }
    end
  end
end

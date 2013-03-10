class LunarDatesController < ApplicationController
  respond_to :json
# http://localhost:3000/lunar_dates/1978-04-07+15%3A30.json  
  def show
    date = DateTime.parse(params[:id])
    four_pillars = LunarDate.from_date_time(date)
    respond_to do |format|
      format.any {
        render text: JSON.generate(four_pillars.as_json) 
      }
    end
  end
end

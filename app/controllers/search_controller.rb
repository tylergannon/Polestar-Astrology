class SearchController < ApplicationController
  def index
  end
  
  def create
    palaces = {}
    stars = {}
    params.each do |name, val|
      if match = name.match(/palace_(\d+)/)
        palaces[match[1]] = val
      elsif match = name.match(/star_(\d+)/)
        stars[match[1]] = val
      end
    end
    
    query = []
    
    stars.each do |index, name|
      palace_id = palaces[index].to_i
      logger.info "#{name}: #{palace_id}"
      if palace_id == 12
        logger.info "I think palace should be 1"
        palace_id == 1
      else
        logger.info "drop it by 1"
        palace_id -= 1
      end
      star_column = name.gsub(/-/, '_')
      query << "(ming_id - #{star_column}_id) % 12 = #{palace_id}"
    end
    
    charts = Chart.where(query.join(' AND '))
    @people = current_member.people.where(chart_id: charts.map(&:id))
    
    logger.info query.join(' AND ').inspect
    logger.info palaces.inspect
    logger.info stars.inspect
    # @people = []
    respond_to do |format|
      format.html {
        if @people.empty?
          render action: 'index'
        end
      }
    end
  end
end

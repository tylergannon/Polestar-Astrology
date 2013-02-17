class ChartPalace < ActiveRecord::Base
  belongs_to :palace
  belongs_to :chart
  belongs_to :location, class_name: 'Branch'

  attr_reader :great_limit
  
  delegate :name, :ordinal, to: :palace
  
  def my_star_relationships(member, *including)
    return [] if stars.empty?
    all_relationships = StarRelationshipStar.where(member_id: member.id, star_id: stars.first.id, palace_id: palace.id).map(&:star_relationship)
    all_relationships.select{|relationship|
      relationship.all.all?{|t| self.stars.include?(t.star)} && (
        relationship.any.empty? || relationship.any.any?{|t| self.stars.include?(t.star)}
      )
    }.select {|relationship|
      including.empty? || !(relationship.stars & including).empty?
    }
  end
  
  def great_limit(chart, person)
    clockwise = (person.yin_yang == chart.year.stem.yin_yang)
    great_limit_start = {'wood' => 3, 'fire' => 6, 'metal' => 4, 'water' => 2, 'earth' => 5}[chart.inner_element]
    if clockwise
      logger.info "* " * 40
      logger.info "Clockwise"
      logger.info "* " * 40
      decade_number = ordinal
    else
      logger.info "* " * 40
      logger.info "Anti - Clockwise"
      logger.info "* " * 40
      decade_number = (0..12).to_a[ordinal]
    end
    start = 10 * (decade_number - 1) + great_limit_start
    "#{start}-#{start+9}"
  end
  
  def small_limits(chart, person)
    branch = chart.year.branch
    if %w(horse dog tiger).include?(branch.animal)
      start = Branch.dragon
    elsif %W(monkey rat dragon).include?(branch.animal)
      start = Branch.dog
    else
      start = Branch.goat
    end
    
    # if person.yin_yang == 'yang'
      
    
    start_num = (12 + ordinal-start.ordinal)%12+1
    (0..7).map{|i| start_num + 12*i}.map(&:to_s).join(" ")
    
  end
  
  def stars
    @stars ||= []
  end
  
  def stars=(arr)
    @stars = SortedStarList.new(arr)
  end
  
  def major_stars
    SortedStarList.new stars.select{|t| t.rank <= 4}
  end
  
  def minor_stars
    SortedStarList.new stars.select{|t| t.rank > 4}
  end
  
  class SortedStarList < Array
    def sort_by_rank
      sort{|x,y| 
        if x.rank == y.rank
          x.id <=> y.id
        else
          x.rank <=> y.rank
        end
      }
    end
  end
end

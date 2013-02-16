module PalacesHelper
  def to_star_links(relationship_star_list)
    relationship_star_list.map{|t| link_to "#{t.star.pinyin} / #{t.star.english}", t.star}
  end
  
  def star_select
    options = [['Filter by Star', '']] + Star.all.map{|star| [star.full_name, star.to_param]}
    select_tag 'choose_star', options_for_select(options, params[:star_id]), id: 'star_filter_select', class: 'tooltippy', data: {palace: @palace.to_param, original_title: 'Select a star here to show only star information in this palace related to the chosen star.  Select "Filter by Star" again to return.'}
  end
end

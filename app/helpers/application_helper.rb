module ApplicationHelper
  def numeric(number)
    "#{number}<sup>#{number==1 ? 'st' : (number==2 ? 'nd' : (number==3 ? 'rd' : 'th'))}</sup>".html_safe
  end
  
  def human_list(arr)
    if arr.size == 0
      return ""
    elsif arr.size == 1
      return arr.to_s
    else
      return arr[0..arr.size-2].join(', ') + ' and ' + arr.last.to_s
    end
  end
end

$ ->
  $(document).on 'click', '.add_star_relationship_star',  (e) ->
    $the_ul_tag = $(this).parent().parent().parent()
    $the_li_tag = $(this).parent().parent().clone()
    $the_li_tag.val('')
    $the_ul_tag.append $the_li_tag
    e.preventDefault()
  
  $(document).on 'click', '.remove_star_relationship_star', (e) ->
    e.preventDefault()
    $the_li_tag = $(this).parent().parent()
    $the_li_tag.remove() unless $the_li_tag.siblings().size() == 0

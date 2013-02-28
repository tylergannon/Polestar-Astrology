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

  $(document).on 'click', '#add_star_to_all', (e) ->
    e.preventDefault()
    if getSelectedVal() == ""
      alert('Best to select a star first.')
      return
    addStarToAll getSelectedStarName(), getSelectedVal(), getSelectedStarId()
    getSelectedStarOption().attr 'disabled', true
    $('#select_star').val('')
    
  # Should be able to remove stars and add them back to the select list.
  $(document).on 'click', '.star_relationship_list a.remove', (e) ->
    e.preventDefault()
    $el = $(this).parent()
    val = $el.data 'value'
    $el.remove()
    $('#select_star option[value=' + val + ']').attr 'disabled', false
    val

  $(document).on 'click', '#add_star_to_any', (e) ->
    e.preventDefault()
    if getSelectedVal() == ""
      alert('Best to select a star first.')
      return
    addStarToAny getSelectedStarName(), getSelectedVal(), getSelectedStarId()
    getSelectedStarOption().attr 'disabled', true
    $('#select_star').val('')
    
  $(document).on 'click', '#all_stars a.move', (e) ->
    e.preventDefault()
    # Remove the star
    $el = $(this).parent()
    addStarToAny $el.data('name'), $el.data('value'), $el.data('id')
    $el.remove()

  $(document).on 'click', '#any_stars a.move', (e) ->
    e.preventDefault()
    # Remove the star
    $el = $(this).parent()
    addStarToAll $el.data('name'), $el.data('value'), $el.data('id')
    $el.remove()
    
  $(document).on 'click', '#show_star_relationship_help', (e) ->
    e.preventDefault()
    $('#star_relationship_help').modal 'show'
    $('#star_relationship_help').on 'hidden', () ->
      $('#new_star_relationship_modal').modal 'show'
  



addStarToAll = (name, friendly_id, id) ->
  addStar name, friendly_id, id, '#all_stars', 'right', 'all'

addStarToAny = (name, friendly_id, id) ->
  addStar name, friendly_id, id, '#any_stars', 'left', 'any'

addStar = (name, friendly_id, id, selector, direction, type) ->
  $(selector).append
  
  new_element = HandlebarsTemplates['star_relationships/list_item']
    id: id
    friendly_id: friendly_id
    name: name
    direction: direction
    type: type
    
  element_to_select_after = findElementToSelectAfter id, selector
  if element_to_select_after?
    $(new_element).insertAfter $(element_to_select_after)
  else
    $(selector).prepend(new_element)

findElementToSelectAfter = (id, selector) ->
  elements_before = _.select $(selector + ' li'), (item) ->
    parseInt($(item).data('id')) < parseInt(id.toString())
  _.last elements_before
  

getSelectedStarOption = () ->
  $('#select_star').find('[value='+getSelectedVal()+']')

getSelectedVal = () ->
  $('#select_star').val()

getSelectedStarId = () ->
  getSelectedStarOption().data('id')
  
getSelectedStarName = () ->
  getSelectedStarOption().html()
  

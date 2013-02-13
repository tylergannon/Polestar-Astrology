# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.control_box .add_comment_link a').click (e) ->
    $this = $(this)
    $this.parents('.star_relationship').find('.new_comment').show()
    e.preventDefault()
    return false
    
  $('#star_filter_select').change (e) ->
    new_star = $(this).val()
    new_location = "/palaces/" + $(this).data('palace') + '/'
    unless new_star == ''
      new_location += 'by_star/' + new_star + '/'
    window.location.href = new_location

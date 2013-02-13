# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  term_count = 1
  $('#new_search_term').click (e) ->
    $('#search_form').append window.thePartial.replace(/XXX/g, term_count.toString())
    term_count += 1
    e.preventDefault()
    setupDeleteLinks()
  setupDeleteLinks()
    
setupDeleteLinks = () ->
  $('a[data-delete]').click (e)->
    $('#' + $(this).data('delete')).remove()
    e.preventDefault()
    
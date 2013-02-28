# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

addComment = (comment) ->
  $('#comments').append(comment)
  $('#new_comment_form textarea').attr('value', '')

window.addComment = addComment

$ ->
  $(document).on 'click', '.comment.clickable', (e) ->
    e.preventDefault()
    $.getScript('/comments/' + $(this).data('id') + '/edit')
    $(this).removeClass('clickable')
  
  $('.comments_list[data-load-from]').each (index, element) ->
    $.ajax(
      dataType: 'script'
      url: $(element).data('load-from')
    )
  # http://localhost:3000/stems_and_branches/water-monkey/comments.js
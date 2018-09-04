# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  #delete photo on show album page
  $("a[data-remote]").click "ajax:success", (e, data, status, xhr) ->
    alert "Фотография удалена!"
    location.reload();

  #clear comment form after submit
  $("#comment-form").bind("ajax:complete", (e, data, status, xhr) ->
    $('#comment_content').val('');
  )

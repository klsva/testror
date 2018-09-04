# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  #выбор картинок через селект
  change_trigger = (handler) ->
    $.get
      url: "/competitions/#{$('select').val()}"
      success: (data) ->
        #console.log(data)
        box = $ '.carousel-inner'
        box.empty()
        data.forEach (i) ->
          box.append "<div  class='item'><img id=#{i.id} class='center' src=#{i.file.url}></div>"

        $($('.item')[0]).addClass('active');

        box2 = $ '.album-id'
        box2.empty()
        box2.append "<a class=btn-link href=/results/#{$('select').val()}>Посмотреть результаты голосования</a>"


  $('select').change change_trigger
  change_trigger $('select')

  #id в оценку
  info = ->
    $.get
      url: "/info/#{$('.active > img').attr('id')}"
      success: (data) ->
        console.log(data)
        box = $ '.photo-id'
        box.empty()
        #box.append "<div  class='qwert'>#{data.id}</div>"
        box.append "<input type=hidden name=value[photo_id] id=value_photo_id value=#{data.id}>"


  $('#rating-form').change info







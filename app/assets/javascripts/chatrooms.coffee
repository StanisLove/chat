$(document).on "turbolinks:load", ->
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault() # isn't go to next line
      $(this).submit()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
    body        = $("#message_body")

    App.chatrooms.send_message(chatroom_id, body.val())

    body.val("")

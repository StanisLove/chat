App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if active_chatroom.length > 0
      active_chatroom.append(data.message)
    else
      chatroom_link = $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']")
      chatroom_link.css("font-weight", "bold")

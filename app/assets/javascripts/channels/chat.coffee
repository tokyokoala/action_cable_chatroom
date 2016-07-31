App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#message_content').append "<div>#{data['message']}</div>"

  speak: (content) ->
    @perform 'speak', message: content

jQuery ->
  $('#chat_content').on 'keypress', (event) ->
    if event.keyCode is 13
      App.chat.speak event.target.value
      event.target.value = ''
      event.preventDefault()


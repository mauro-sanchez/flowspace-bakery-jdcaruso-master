App.cookie = App.cable.subscriptions.create "CookieChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.cookie-info').html(data.oven_status); 

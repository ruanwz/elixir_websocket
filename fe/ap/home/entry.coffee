React = require 'react'
ChatApp = require './components/ChatApp.react.cjsx'

messages = [{body: 'test'}]
window.messages = messages
websocket_init = ->
  socket = new Phoenix.Socket("ws://"+location.host+"/ws")
  socket.join "chats:all", {}, (channel)->
    channel.on "join", (message)->
      console.log(message)
      channel.send('incoming:event', {content: 'abcd'})
    channel.on 'pong', (message)->
      console.log(message)
    channel.on 'new:msg', (message)->
      console.log(message)
      messages.push message
      window.message_callback()
    channel.send("new:msg", {user: 'david', body: 'test string'})
    window.channel = channel

websocket_init()
React.render React.createElement(ChatApp,messages: messages),
  document.getElementById('chatapp')





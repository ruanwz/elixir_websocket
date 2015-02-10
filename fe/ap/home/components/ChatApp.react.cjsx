require '../less/material.less'
React = require("react")
injectTapEventPlugin = require("react-tap-event-plugin")
injectTapEventPlugin()
mui = require("material-ui")
RaisedButton = mui.RaisedButton
DatePicker = mui.DatePicker
DropDownMenu = mui.DropDownMenu
DropDownIcon = mui.DropDownIcon
IconButton = mui.IconButton
Icon = mui.Icon
Toolbar = mui.Toolbar
ToolbarGroup = mui.ToolbarGroup
ENTER_KEY_CODE = 13
ChatApp = React.createClass
  getInitialState: ->
    messages: window.messages
  componentDidMount: ->
    window.message_callback = @_onChange
  render: ->
    <div>
      <div id="messages">
        Hello
        <ul>
          {this.build_message message for message in this.state.messages}
        </ul>

      </div>

      <textarea value={@state.text} onChange={@_onTextChange} onKeyDown={@_onKeyDown}></textarea>
      <br/>
      <label>From</label>
      <input type="text" value={@state.author} onChange={@_onAuthorChange}></input>
    </div>
  build_message: (message)->
    <div>{message.user || "someone"}: {message.body}</div>

  _onChange: ->
    @setState messages: window.messages
  _onAuthorChange: (event, value)->
    @setState author: event.target.value
  _onTextChange: (event, value)->
    @setState text: event.target.value
  _onKeyDown: (event)->
    if event.keyCode == ENTER_KEY_CODE
      window.channel.send "new:msg", {user: @state.author, body:@state.text }
      @setState text: ''
    


module.exports = ChatApp

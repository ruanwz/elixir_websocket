#require '../less/material.less'
require '../css/bootstrap.css'
React = require("react")
injectTapEventPlugin = require("react-tap-event-plugin")
injectTapEventPlugin()
mui = require("material-ui")
ListGroup = require("react-bootstrap/ListGroup")
ListGroupItem = require("react-bootstrap/ListGroupItem")
Input = require("react-bootstrap/Input")
Grid = require("react-bootstrap/Grid")
Row = require("react-bootstrap/Row")
Col = require("react-bootstrap/Col")
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
      <Grid>
        <Row>
          <div id="messages">
            <ListGroup>
              {this.build_message message for message in this.state.messages}
            </ListGroup>

          </div>
        </Row>
        <Row>
          <Col xs={6} md={4}>
            <Input type="text" label="From" placeholder="enter your name" value={@state.author} onChange={@_onAuthorChange}></Input>
          </Col>
        </Row>
        <Row>
          <Input type="textarea" label="Message" placeholder="You say ..." value={@state.text} onChange={@_onTextChange} onKeyDown={@_onKeyDown}></Input>
        </Row>
      </Grid>
    </div>
  build_message: (message)->
    <ListGroupItem>{message.user || "someone"}: {message.body}</ListGroupItem>
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

@WebsiteForm = React.createClass
  getInitialState: ->
    url: ''
  valid: ->
    @state.url
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post 'websites', { website: @state }, (data) =>
      @props.handleNewWebsite data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Url'
          name: 'url'
          value: @state.url
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create websites'
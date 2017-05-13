@Website = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleEdit: (e) ->
    e.preventDefault()
    data =
      url: @refs.url.value
    $.ajax
      method: 'PUT'
      url: "/websites/#{ @props.website.id }"
      dataType: 'JSON'
      data:
        website: data
      success: (data) =>
        @setState edit: false
        @props.handleEditWebsite @props.website, data
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/websites/#{ @props.website.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteWebsite @props.website
  websiteRow: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.a
          href: "/websites/#{ @props.website.id }"
          @props.website.id
      React.DOM.td null, @props.website.url
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  websiteForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          disabled: 'false'
          defaultValue: @props.website.id
          ref: 'id'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.website.url
          ref: 'url'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @websiteForm()
    else
      @websiteRow()
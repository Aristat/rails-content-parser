@WebsiteContent = React.createClass
  websiteRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.website_content.name
      React.DOM.td null, @props.website_content.tag_name.name
  render: ->
    @websiteRow()
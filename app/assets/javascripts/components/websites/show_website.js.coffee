@ShowWebsite = React.createClass
  getInitialState: ->
    website_contents: []
    id: ''
    url: ''
  componentDidMount: ->
    @getDataFromApi(@props.id)
  getDataFromApi: (id) ->
    $.ajax
      method: 'GET'
      url: "/websites/#{id}"
      dataType: 'JSON'
      success: (data) =>
        @setState id: data.website.id, url: data.website.url, website_contents: data.website_contents
  getDefaultProps: ->
    website_contents: []
  render: ->
    React.DOM.div
      className: 'show_website'
      React.DOM.a
        href: "/websites"
        'Websites'
      React.DOM.h2
        className: 'title'
        'Show website: ' + @state.id + ' ' + @state.url
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Type name'
        React.DOM.tbody null,
          for website_content in @state.website_contents
            React.createElement WebsiteContent, key: website_content.id, website_content: website_content
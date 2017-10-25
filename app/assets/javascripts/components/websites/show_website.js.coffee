@ShowWebsite = React.createClass
  getInitialState: ->
    website_contents: [],
    id: '',
    url: '',
    page: 1,
    pages: 0
  componentDidMount: ->
    @getDataFromApi(@props.id, @state.page)
  getDataFromApi: (id, page) ->
    $.ajax
      method: 'GET'
      url: "/websites/#{id}"
      dataType: 'JSON'
      data:
        page: page
      success: (data) =>
        @setState id: data.website.id, url: data.website.url,
        website_contents: data.website_contents, pages: parseInt(data.pages), page: parseInt(data.page)
  getDefaultProps: ->
    website_contents: []
  handleChangePage: (page) ->
    @getDataFromApi(@props.id, page)
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
      React.createElement Pagination, page: @state.page, pages: @state.pages, handleChangePage: @handleChangePage

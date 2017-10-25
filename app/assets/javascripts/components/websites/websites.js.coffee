@Websites = React.createClass
  getInitialState: ->
    websites: [],
    page: 1,
    pages: 0
  componentDidMount: ->
    @getDataFromApi(@state.page)
  getDataFromApi: (page) ->
    $.ajax
      method: 'GET'
      url: "/websites"
      dataType: 'JSON'
      data:
        page: page
      success: (data) =>
        @setState websites: data.websites, pages: parseInt(data.pages), page: parseInt(data.page)
  getDefaultProps: ->
    websites: []
  addWebsite: (website) ->
    websites = React.addons.update(@state.websites, { $push: [website] })
    @setState websites: websites
  updateWebsite: (website, data) ->
    index = @state.websites.indexOf website
    websites = React.addons.update(@state.websites, { $splice: [[index, 1, data]] })
    @setState websites: websites
  deleteWebsite: (website) ->
    index = @state.websites.indexOf website
    websites = React.addons.update(@state.websites, { $splice: [[index, 1]] })
    @setState websites: websites
  handleChangePage: (page) ->
    @getDataFromApi(page)
  render: ->
    React.DOM.div
      className: 'websites'
      React.DOM.h2
        className: 'title'
        'Websites'
      React.createElement WebsiteForm, handleNewWebsite: @addWebsite
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Id'
            React.DOM.th null, 'Url'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for website in @state.websites
            React.createElement Website, key: website.id, website: website, handleDeleteWebsite: @deleteWebsite, handleEditWebsite: @updateWebsite
      React.createElement Pagination, page: @state.page, pages: @state.pages, handleChangePage: @handleChangePage

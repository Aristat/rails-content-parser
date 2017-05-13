@Pagination = React.createClass
  paginationElement: (number) ->
    React.DOM.li
      key: 'page' + number
      className: number == @props.page ? 'active' : ''
      React.DOM.a
        onClick: @props.handleChangePage.bind(null, number)
        number
  render: ->
    self = this
    page = @props.page
    last_page = @props.pages
    page_links = []
    max_elements = 2
    pages = [ 1 ]
    i = page - max_elements

    while i <= page + max_elements
      if !pages.includes(i)
        pages.push i
      i++

    if !pages.includes(last_page)
      pages.push last_page

    pages.forEach (i) ->
      if i > 0 and i <= last_page
        page_links.push self.paginationElement(i)

    React.DOM.div
      className: 'text-center'
      React.DOM.ul
        className: "pagination"
        page_links

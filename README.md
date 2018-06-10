# Devcamp Portfolio Application

> This is a Ruby on Rails 5 application that allows users to create their own portfolios.

### Features

- Real time chat engine for comments
- Blog
- Portfolio
- Drag and drop interface

### Code Example

```ruby
def sort 
  params[:order].each do |key, value|
    Portfolio.find(value[:id]).update(position: value[:position])
  end
  render nothing: true
end
```

```javascript
set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

readys = ->
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: '/portfolios/sort'
      data: order: updated_order
    return
  return

$(document).ready readys
```


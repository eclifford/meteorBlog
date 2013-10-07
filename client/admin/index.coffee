Template.admin.helpers 
  posts: ->
    return Posts.find {}


Template.admin.events 
  'click .delete': (e) ->
    e.preventDefault()

    $row = $(e.toElement).closest('tr')

    if confirm("Delete this post?")
      Posts.remove $row.attr('id')
      Router.go('admin')


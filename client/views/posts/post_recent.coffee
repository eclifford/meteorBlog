Template.postRecent.helpers
  posts: ->
    return @Posts.find {},
      sort:
        submitted: - 1
      limit: 10
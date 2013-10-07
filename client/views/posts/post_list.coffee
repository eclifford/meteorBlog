Template.postList.helpers
  # posts: ->
  #   return Posts.find {},
  #     sort:
  #       submitted: - 1
  #     limit: postsHandle.limit()

  postsReady: ->
    return ! postsHandle.loading()

  allPostsLoaded: ->
    return ! postsHandle.loading() and Posts.find().count < postsHandle.loaded()

Template.postList.events
  'click .load-more': (e) ->
    e.preventDefault()
    postsHandle.loadNextPage()
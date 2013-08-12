Template.postDetail.helpers 
  currentPost: ->
    post = Posts.findOne
      slug: Session.get 'currentPostUrl'

    # Hacky figure out why templates are called twice
    if post
      Session.set 'currentPostId', post._id

    return post

  comments: ->
    Comments.find 
      postId: @_id

Template.postDetail.rendered = ->
  @findAll("pre code").forEach (e) ->
    hljs.highlightBlock e
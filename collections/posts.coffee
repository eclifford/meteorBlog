@Posts = new Meteor.Collection 'posts'

@Posts.allow
  update: ->
    return true
  remove: ->
    return true

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()

    post = _.extend _.pick(postAttributes, 'title', 'tags', 'body'), 
      authorId: user._id
      authorName: user.username
      authorGravatar: user.profile.gravatar
      submitted: new Date().getTime()
      numComments: 0
      draft: true 
      votes: 0
      upvoters: []
      slug: postAttributes.title.replace(/[^a-zA-Z0-9\s]/g,"").toLowerCase().replace(/\s/g, '-')

    Posts.insert post

    return post.slug

  upvote: (postId) ->
    user = Meteor.user()
    post = Posts.findOne postId

    if _.include post.upvoters, user._id
      throw new Meteor.Error(422, 'Already upvoted this post')

    Posts.update post._id,
      $addToSet: 
        upvoters: user._id
      $inc:
        votes: 1
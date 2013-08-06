@Posts = new Meteor.Collection 'posts'

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()

    post = _.extend _.pick(postAttributes, 'title', 'tags', 'body'), 
      authorId: user._id
      authorName: user.username
      submitted: new Date().getTime()
      numComments: 0
      draft: false
      slug: postAttributes.title.replace(/[^a-zA-Z0-9\s]/g,"").toLowerCase().replace(/\s/g, '-')

    Posts.insert post

    return post.slug
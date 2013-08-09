#
# Comment Collection
#
@Comments = new Meteor.Collection 'comments'

Meteor.methods
  comment: (commentAttributes) ->
    user = Meteor.user()
    post = Posts.findOne commentAttributes.postId

    # Ensure the user is logged in
    if not user
      throw new Meteor.Error 401, "You need to log in to comment"

    if not commentAttributes.body
      throw new Meteor.Error 422, "Please write some content"

    if not commentAttributes.postId
      throw new Meteor.Error 422, "You must comment on a valid post"

    # Create the comment
    comment = _.extend _.pick(commentAttributes, 'postId', 'body'), 
      userId: user._id
      author: user.username
      gravatar: user.profile.gravatar
      submitted: new Date().getTime()

    # Increase the comment count
    Posts.update comment.postId, 
      $inc: 
        numComments: 1

    Comments.insert comment

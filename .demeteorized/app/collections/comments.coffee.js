this.Comments = new Meteor.Collection('comments');

Meteor.methods({
  comment: function(commentAttributes) {
    var comment, post, user;

    user = Meteor.user();
    post = Posts.findOne(commentAttributes.postId);
    if (!user) {
      throw new Meteor.Error(401, "You need to log in to comment");
    }
    if (!commentAttributes.body) {
      throw new Meteor.Error(422, "Please write some content");
    }
    if (!commentAttributes.postId) {
      throw new Meteor.Error(422, "You must comment on a valid post");
    }
    comment = _.extend(_.pick(commentAttributes, 'postId', 'body'), {
      userId: user._id,
      author: user.username,
      gravatar: user.profile.gravatar,
      submitted: new Date().getTime()
    });
    Posts.update(comment.postId, {
      $inc: {
        numComments: 1
      }
    });
    return Comments.insert(comment);
  }
});

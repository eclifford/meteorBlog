Meteor.publish('posts', function(limit) {
  return Posts.find({}, {
    sort: {
      submitted: -1
    },
    limit: limit
  });
});

Meteor.publish('comments', function(postId) {
  return Comments.find({}, {
    postId: postId,
    sort: {
      submitted: -1
    }
  });
});

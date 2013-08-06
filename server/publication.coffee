#
# Mongo publications to frontend
#

# Posts publication
Meteor.publish 'posts', (limit) ->
  return Posts.find {},
    sort: 
      submitted: -1
    limit: 
      limit

# Comments publication
Meteor.publish 'comments', (postId) ->
  return Comments.find {},
    postId: postId
    sort:
      submitted: -1
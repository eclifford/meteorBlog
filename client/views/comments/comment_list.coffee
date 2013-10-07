Template.commentList.helpers 
  comments: ->
    Comments.find 
      postId: @_id
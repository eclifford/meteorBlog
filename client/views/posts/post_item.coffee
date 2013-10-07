Template.postItem.helpers
  formatted_date: ->
    return moment.utc(@submitted).format("MM.DD.YY")

Template.postItem.events 

  'click .delete': (e) ->
    e.preventDefault()

    if confirm("Delete this post?")
      Posts.remove @_id

  'click .publish': (e) ->
    e.preventDefault()

    if @draft
      Posts.update @_id,
        $set:
          draft: false

  'click .unpublish': (e) ->
    e.preventDefault()

    unless @draft
      Posts.update @_id,
        $set: 
          draft: true

  'click .vote': (e) ->
    e.preventDefault()
    userId = Meteor.userId()

    if userId and !_.include @upvoters, userId
      Meteor.call 'upvote', @_id

# Template.postItem.rendered = ->
#   @findAll("pre code").forEach (e) ->
#     hljs.highlightBlock e

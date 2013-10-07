Template.layout.helpers 
  loginImage: ->
    user = Meteor.user()

    if user
      return "<img src='http://gravatar.com/avatar/#{user.profile.gravatar}?s=50' class='pull-left' />"

Template.layout.rendered = ->
  $("pre code").each (i, e) ->
    hljs.highlightBlock e
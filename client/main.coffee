@postsHandle = Meteor.subscribeWithPagination 'posts', 5

Deps.autorun ->
  Meteor.subscribe 'comments', Session.get 'currentPostId'

# Template.body.helpers
#   layoutName: ->
#     switch Meteor.Router.page()
#       when "adminPage" 
#         return 'adminLayout'
#       else 
#         return 'defaultLayout'



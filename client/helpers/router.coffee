Meteor.Router.add 
  '/': 'postList'

  '/posts/:slug': 
    to: 'postDetail'
    and: (slug) ->
      Session.set 'currentPostUrl', slug

  '/admin/posts/new': 'postSubmit'

Meteor.Router.filters
  'requireLogin': (page) ->
    if Meteor.user()
      return page
    else if Meteor.loggingIn()
      return 'loading'
    else
      return 'accessDenied'

Meteor.Router.filter 'requireLogin', 
  only: 'postSubmit'
adminFilter = ->
  user = Meteor.user()
  unless user
    @render "accessDenied"
    @stop()

Router.map ->
  @route 'postList', 
    path: '/'
    data: ->
      if Meteor.user() and Meteor.user().profile.type is 'admin' 
        return Posts.find {},
          sort:
            submitted: - 1
          limit: postsHandle.limit()
      else 
        return Posts.find {draft: false},
          sort:
            submitted: - 1
          limit: postsHandle.limit()

  @route 'postDetail',
    path: '/posts/:slug'
    data: ->
      return Posts.findOne 
        slug: @params.slug

  @route 'postSubmit',
    onBeforeRun: adminFilter
    path: '/admin/posts/new'

  @route 'postEdit',
    onBeforeRun: adminFilter
    path: '/admin/posts/edit/:id'
    data: ->
      Session.set('currentPostId', @params.id)
      return Posts.findOne 
        _id: @params.id

  @route 'admin', 
    onBeforeRun: adminFilter
    path: '/admin'


Router.configure 
  layout: 'layout' 

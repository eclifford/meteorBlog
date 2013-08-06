Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault() 

    post = 
      title: $(e.target).find('[name=title]').val()
      tags: [$(e.target).find('[name=title]').val()]
      body: $(e.target).find('[name=body]').val()

    Meteor.call 'post', post, (error, slug) ->
      if error
        alert 'error'
      else
        Meteor.Router.to 'postDetail', slug

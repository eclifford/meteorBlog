Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault() 
    post = 
      title: $(e.target).find('[name=title]').val()
      tags: [$(e.target).find('[name=title]').val()]
      body: editor.value

    Meteor.call 'post', post, (error, slug) ->
      if error
        alert 'error'
      else
        Router.go 'postDetail', {slug: slug}

Meteor.startup ->
  window.editor = new ReactiveAce

  Template.postSubmit.rendered = ->
    editor.attach ace.edit 'aceEditor'
    editor.theme = 'github'
    editor.syntaxMode = 'markdown'
    editor.changed = (e) ->
      converter = new Showdown.converter()
      
      $('#preview').html(converter.makeHtml(editor.value))
      $("pre code").each (i, e) ->
        hljs.highlightBlock e



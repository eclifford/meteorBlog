Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault() 
    editor = ace.edit("editor")

    post = 
      title: $(e.target).find('[name=title]').val()
      tags: [$(e.target).find('[name=title]').val()]
      body: editor.getValue()

    Meteor.call 'post', post, (error, slug) ->
      if error
        alert 'error'
      else
        Meteor.Router.to 'postDetail', slug

Template.postSubmit.rendered = ->
  editor = ace.edit("editor")

  editor.setTheme("ace/theme/github")
  editor.getSession().setMode("ace/mode/markdown")
  editor.setShowPrintMargin(false)

  editor.getSession().on 'change', (e) ->
    converter = new Showdown.converter()

    $('#preview').html(converter.makeHtml(editor.getValue()))
    $("pre code").each (i, e) ->
      hljs.highlightBlock e



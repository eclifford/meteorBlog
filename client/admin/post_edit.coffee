window.editor = new ReactiveAce

Template.postEdit.events
  'submit form': (e) ->
    e.preventDefault() 

    currentPostId = Session.get 'currentPostId'

    post = 
      title: $(e.target).find('[name=title]').val()
      tags: [$(e.target).find('[name=title]').val()]
      body: editor.value

    Posts.update currentPostId, {$set: post}, (error) ->
      if error
        alert error.reason
      else
        Router.go('postList')


Template.postEdit.rendered = ->
  editor.attach ace.edit 'aceEditor'
  editor.theme = 'monokai'
  editor.syntaxMode = 'markdown'
  editor.tabSize = 2;
  editor.softTabs = false;

  e = ace.edit("aceEditor")
  e.setValue @data.body
  
  editor.changed = (e) ->
    converter = new Showdown.converter()
    
    $('#preview').html(converter.makeHtml(editor.value))

    $("pre code").each (i, e) ->
      hljs.highlightBlock e

#Template.postEdit.rendered = ->
  # editor = new ReactiveAce()
  # editor.attach('editor')
  # editor = ace.edit("editor")
  # editor.setTheme("ace/theme/github")
  # editor.getSession().setMode("ace/mode/markdown")
  # editor.setShowPrintMargin(false)
  # editor.setValue(@data.body)
Template.postItem.helpers
  formatted_date: ->
    return moment.utc(@submitted).format("DD MMM / YYYY")

Template.postItem.rendered = ->
  @findAll("pre code").forEach (e) ->
    hljs.highlightBlock e

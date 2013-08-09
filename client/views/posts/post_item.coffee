Template.postItem.helpers
  formatted_date: ->
    return moment.utc(@submitted).format("DD MMM / YYYY")

Template.postItem.rendered = ->
  console.log @find("pre, code")


  @findAll("pre code").forEach (e) ->
    hljs.highlightBlock e
  # $("pre code", .each (i, e) ->
  #   hljs.highlightBlock e
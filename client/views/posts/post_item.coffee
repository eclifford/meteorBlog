Template.postItem.helpers
  formatted_date: ->
    return moment.utc(@submitted).format("DD MMM / YYYY")
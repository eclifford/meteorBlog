Handlebars.registerHelper "formatted_date", ->
  return moment.utc(@submitted).format("MM.DD.YY")

Handlebars.registerHelper "is_admin", ->
  if Meteor.user()
    Meteor.user().profile.type is 'admin'
  else 
    false
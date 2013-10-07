# Create the Default Admin
if Meteor.users.find().count() is 0
  Accounts.createUser
    username: 'admin'
    email: 'admin@admin.com'
    password: 'admin'
    profile: 
      name: 'Eric Clifford'
      type: 'admin'




# if @Posts.find().count() is 0

#   ericId = Meteor.users.insert
#     profile:
#       name: 'Eric Clifford'
#       email: 'ericgclifford@gmail.com'

#   eric = Meteor.users.findOne(ericId)

#   Posts.insert
#     title: 'Welcome to my Meteor Blog'
#     authorId: ericId 
#     authorName: eric.profile.name 
#     body: "#Testing"
#     slug: 'welcome-to-my-meteor-blog'
#     draft: false,
#     submitted: new Date().getTime()
#     updated: new Date().getTime()
#     tags: ['MeteorJS', 'JavaScript']
#     numComments: 0

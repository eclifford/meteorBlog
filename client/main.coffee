@postsHandle = Meteor.subscribeWithPagination 'posts', 5

Deps.autorun ->
  Meteor.subscribe 'comments', Session.get 'currentPostId'

console.log CryptoJS

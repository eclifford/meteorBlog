var eric, ericId;

if (this.Posts.find().count() === 0) {
  ericId = Meteor.users.insert({
    profile: {
      name: 'Eric Clifford'
    }
  });
  eric = Meteor.users.findOne(ericId);
  Posts.insert({
    title: 'Welcome to my Meteor Blog',
    authorId: ericId,
    authorName: eric.profile.name,
    body: "#Testing",
    slug: 'welcome-to-my-meteor-blog',
    draft: false,
    submitted: new Date().getTime(),
    updated: new Date().getTime(),
    tags: ['MeteorJS', 'JavaScript'],
    numComments: 0
  });
}

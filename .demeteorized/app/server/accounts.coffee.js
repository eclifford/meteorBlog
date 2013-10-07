var md5;

md5 = Meteor.require('MD5');

Accounts.onCreateUser(function(options, user) {
  if (options.profile) {
    user.profile = options.profile;
  }
  user.profile = {};
  user.profile.gravatar = md5(user.emails[0].address);
  return user;
});

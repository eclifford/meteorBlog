Accounts.onCreateUser (options, user) ->
  if options.profile
    user.profile = options.profile
  return user
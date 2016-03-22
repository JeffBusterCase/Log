require '../bin/log'

=begin  Appending user type of data
=end
logc = Log.new

logc.useDefaultRule

logc.register({
  login: "jefferson",
  password: "123456789987654321"
})


puts logc.login( {login: "jefferson", password: "123456789987654321"} ), #true
     logc.login( {login: "not_registered_account", password: "not_registered_password"} ) #false


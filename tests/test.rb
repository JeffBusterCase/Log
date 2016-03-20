require '../bin/log'

=begin  Appending user type of data
=end
log = Log.new

log.useDefaultRule

log.register ({
  login: 'JeffBusterCase',
  password: "1234567890123456"
})

puts log.login({
  login: "JeffBusterCase",
  password: "1234567890123456"
})

puts log.temp

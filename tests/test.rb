require '../bin/log'

=begin  Appending user type of data
=end
log = Log.new

log.useDefaultRule

log.register ({
   login: 'Jefferson',
   password: "12345678910111231234"
})

puts log.login({
  login: "Jefferson",
  password: "12345678910111231234"
 })
 puts log.login({
   login: "Jefferson",
   password: "12345678910111231234"
  })
  puts log.login({
    login: "Jefferson",
    password: "010101010101010101010101"
   })

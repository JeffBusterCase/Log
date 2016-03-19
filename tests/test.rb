require '../bin/log'

=begin  Appending user type of data
=end

msg = Log.new

msg.userData = {
  name: "",
  age: Fixnum
}

msg.registerRule = {
  login: String,
  password: String,
  not: {
    password: "@*&%$#!"
  }
}

msg.register 'first', {
  login: "Jefferson",
  password: "1234"
}
#Antes da mudança
p comunicationSystem.temp


#Após mudança
p comunicationSystem.temp

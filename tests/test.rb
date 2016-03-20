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
  primarKey: :password,
  meta: :login,
  not: {
    password: Default[:badChars]
  }
}
msg.register 'randomKey', ({
  login: 'jeff',
  password: '1234'
})







#Antes da mudança
p msg








#Após mudança
p msg

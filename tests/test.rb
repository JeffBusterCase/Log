require '../bin/log'

=begin  Appending user type of data
=end

log = Log.new

log.registerRule = {
  name: String,
  senha: String,
  meta: :name,
  primarKey: :senha,
  not: {
    name: Default[:badChars],
    senha: Default[:badChars]
  }
}

minha_conta = {
  name: 'Jefferson',
  senha: '123456789abcdefghijk'
}

log.register minha_conta

puts "Entrou na conta, #{minha_conta[:name]} ? #{log.login(minha_conta)}",
     "Entrou na conta, nil? #{log.login(name: 'nil', senha: 'nil7777777777777')}"

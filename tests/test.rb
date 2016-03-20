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

log.register ({
    name: "Jefferson",
    senha: "jeffpasswordbomfim"
})
p log
puts log.login({
    name: "Jefferson",
    senha: "jeffpasswordbomfim"
})

require './testClass'


xbia = LogPlus.new 'Xbia', 'xbiasuperbia131719919793'
xbia.meta = :login
xbia.primarKey = :password
xbia.normalize
xbia.register
xbia.login

xbia.add_account 'Jefferson', '123456789987654321'
xbia.changeTo 'Jefferson'
xbia.register
xbia.login


puts xbia.online?
xbia.changeTo 'Xbia'
puts xbia.online?

xbia.changeTo 'Jefferson'

xbia.add_friend 'Xbia'

xbia.changeTo 'Xbia'

xbia.accept 'Jefferson'

xbia.send "Hello", :Xbia

xbia.changeTo 'Xbia'

puts xbia.received :Jefferson


##Resolving Erron on sender.rb:40:in `block in send': Something goes reallt wrong, seems that you do not have the permossion to send message to that person (RintimeError)'

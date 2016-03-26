my_account = LogPlus.new 'jefferson', '123456789987654321'
my_account.meta = :login
my_account.primarKey = :password
my_account.normalize
my_account.register
my_account.login

xbia = LogPlus.new 'Xbia', 'xbiaSuperbia171913313739717379979193'
xbia.meta = :login
xbia.primarKey = :password
xbia.normalize
xbia.register
xbia.login



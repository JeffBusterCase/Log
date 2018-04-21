# Log Version 0.6-alpha
From Jpro-Express. Login system creator. Log

<p>Helps appreciated U.U</p>

<h5>Installing</h5>
<p>Put the <code>bin/principals/</code> in the <code>PATH</code></p>

<h5>Try it Right Now!</h5>

```ruby
require 'log'

logc = Log.new  

logc.registerRule = {
  login: String,
  password: String,
  primarKey: :password,
  meta: :login,
  not: {
    login: "!#$%¨&*( );:/\\,<>'\"][{}ºª°|-+=`^´",#can 'not' use any of this symbols
    password: Default[:badChars]# otherwise raise Error
  }
}
logc.register ({
  login: 'Jefferson',
  password: "1234567891011123"
})
puts logc.login({               #
  login: 'Jefferson',           # => true
  password: "1234567891011123"  #
})                              #
puts logc.login({               #
  login: 'Bart_baker',          # => false
  password: "666"               #
})                              #
```

* After the register if you register an account in a variable the variable will be overrided by the crypted version
* Already implemented ```Log.send``` and ```Log.inbox_from``` to see the recent messages
* You need ```send_add_request``` to someone before sending messages to that person
* Only the people in your friend list can see your messages if the type of it is ```:private```

<h4>This is a pack from Jpro-Express</h4>

<h2>Thanks for the clone!</h2>

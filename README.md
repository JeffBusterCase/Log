# Log Version 0.1-alpha
From Jpro-Express. Login system creator. Log

<p>Helps appreciated U.U</p>

<h5>Installing</h5>
<p>Put the <code>bin/principals/</code> in the <code>PATH</code></p>

<h5>Try it Right Now!</h5>
```Ruby
> require 'log'
>
> logc = Log.new  
>
> logc.registerRule = {
>   login: String,
>   password: String,
>   primarKey: :password,
>   meta: :login,
>   not: {
>     login: "!#$%¨&*( );:/\\,<>'\"][{}ºª°|-+=`^´",#can 'not' use any of this symbols
>     password: Default[:badChars]# otherwise raise Error
>   }
> }
>
> logc.register ({
>   login: 'Jefferson',
>   password: "1234567891011123"
> })
>
>
> puts logc.login({               #
>   login: 'Jefferson',          # => true
>   password: "1234567891011123" #
> })                             #
>
> puts logc.login({               #
>   login: 'Bart_baker',         # => false
>   password: "666"              #
> })                             #
>
>
>
>
>
```

<h4>This is a pack from Jpro-Express</h4>

<h2>Thanks for the clone!</h2>

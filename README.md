# Log
From Jpro-Express. Login system creator. Log
<h5>Installing</h5>
<p>Put the <code>bin/principals/</code> in the <code>PATH</code></p>

<h5>Try it Right Now!</h5>
```Ruby
> require 'log'
>
> log = Log.new  
>
> log.registerRule = {
>   login: String,
>   password: String,
>   not: {
>     login: "!#$%¨&*( );:/\\,<>'\"][{}ºª°|-+=`^´",#can 'not' use any of this symbols
>     password: "!#$%¨&*( );:/\\,<>'\"_][{}ºª°|-+=`^´"# otherwise raise Error
>   }
> }
>
> log.register '01TheFirst', ({
>   login: 'Jefferson',
>   password: '1234'
> })
>
>
> puts log.login({               #
>   login: 'Jefferson',          # => true
>   password: '1234'             #
> })                             #
>
> puts log.login({               #
>   login: 'Bart_baker',         # => false
>   password: '666'              #
> })                             #
>
>
>
>
>
```

<h4>This is a pack from Jpro-Express</h4>

<h2>Thanks for the clone!</h2>

#More example and functions

* How login and logout
* How see users online
* How see a user determined data
* How add a friend to communicate
* How send a message to another user in your friend list

 
Example:
```Ruby
require '../bin/log' #if this file are in '/test/' . Otherwise puts the log.rb equal path 



logc = Log.new

logc.useDefaultRule

logc.register({
    login: 'jefferson',
    password: "123456789987654321"
})
logc.register({
    login: 'julia',
    password: '987654321987654321'
})

logc.login({
    login: 'jefferson',
    password: "123456789987654321"
})
logc.login({
    login: 'julia',
    password: '987654321987654321'
})

p logc.users #show online users
p logc.see_user_data 'jefferson', :all #show all determined user data

#Send add request and accept one
logc.send_add_request({login: 'julia', password: '987654321987654321'}, 'jefferson')
logc.accept_add_request({login: 'jefferson', password:'987654321987654321'}, 'julia')

# Now a send message to jefferson
msg = {
  sender: 'julia',
  catcher: 'jefferson',
  topic: 'Welcome Aboard',
  message: 'Welcome aboard to this beatfull place called Milkway!',
  type: :private
}

#Sending the message
logc.send( Msg.new( msg ), {login: 'julia', password: '987654321987654321'})

#Reading the message
puts logc.inbox_from({login: 'jefferson', password: '123456789987654321'}, 'julia', :last)

logc.logout 'jefferson' #logout from @users(users online)
logc.logout 'julia'     #

p logc.users
```

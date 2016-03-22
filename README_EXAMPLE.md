#More example and functions

* How see users online
* How see a user determined data
* How login and logout
 
Example:
```Ruby
> require '../bin/log' #if this file are in '/test/' . Otherwise puts the log.rb equal path 
>
>
>
> logc = Log.new
>
>
> logc.useDefaultRule
> 
> logc.register({
>     login: 'jefferson',
>     password: "123456789987654321"
> })
>
> p logc.users #show online users
>
> p logc.see_user_data 'jefferson', :all #show all determined user data
>
> puts logc.login({
>     login: 'jefferson',
>     password: "123456789987654321"
> })
>
> p logc.users
> logc.append_user_data 'jefferson', 'phone', '635377989' #add data to a determined user
> logc.append_user_data 'jefferson', 'age', '17' #only append data if user are online
>
> p logc.see_user_data 'jefferson', :all
> p logc.see_user_data 'jefferson', "age"  #show determined data
> p logc.see_user_data 'jefferson', :phone #
>
> logc.logout 'jefferson' #logout from @users(users online)
>
> p logc.users
```
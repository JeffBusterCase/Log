require '../bin/log'



logc = Log.new


logc.useDefaultRule

logc.register({
    login: 'jefferson',
    password: "123456789987654321"
})

p logc.users

p logc.see_user_data 'jefferson', :all

puts logc.login({
    login: 'jefferson',
    password: "123456789987654321"
})
p logc.users
logc.append_user_data 'jefferson', 'phone', '635377989'
logc.append_user_data 'jefferson', 'age', '17'

p logc.see_user_data 'jefferson', :all
p logc.see_user_data 'jefferson', "age"
p logc.see_user_data 'jefferson', :phone

logc.logout 'jefferson'

p logc.users
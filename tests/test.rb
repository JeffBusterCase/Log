require '../bin/log'


logc = Log.new

msg = {
    sender: 'jefferson',
    catcher: 'philipe',
    message: 'Hello Philipe How are you',
    topic: 'Hello from jefferson',
    type: :private
}

logc.useDefaultRule

puts 'Register Jefferson'
logc.register({
    login: 'jefferson',
    password: '123456789987654321'
})
puts "Register Philipe"
logc.register({
    login: 'philipe',
    password: '987654321987654321'
})
puts "Login Philipe"
p logc.login({
    login: 'philipe',
    password: '987654321987654321'
})
puts "Login Jefferson"
p logc.login({
     login: 'jefferson',
    password: '123456789987654321' # Return False. Why!?
})

puts "Define messageRule"
logc.messageRule = {
    sender: :meta,
    catcher: :meta_catcher,
    message: String,
    topic: String,
    type: :all
}
puts 'send_add_request to philipe'
p logc.send_add_request({
    login: 'jefferson', 
    password: '123456789987654321'},
    'philipe'
)

puts "accept_add_request from jefferson" 
p logc.accept_add_request({login: 'philipe', password: '987654321987654321'}, 'jefferson')

p logc.send  Msg.new( logc.messageRule, msg )

p logc.see_user_data 'jefferson', :all
p logc.see_user_data 'philipe', :all
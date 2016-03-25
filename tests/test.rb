require '../bin/log'


logc = Log.new


logc.useDefaultRule


logc.register({
    login: 'jefferson',
    password: '123456789987654321'
})

logc.register({
    login: 'philipe',
    password: '987654321987654321'
})
puts "Login philipe", 
    logc.login({
        login: 'philipe',
        password: '987654321987654321'
    })
puts "Login jefferson",
     logc.login({
         login: 'jefferson',
         password: '123456789987654321' # Return False. Why!?
     })

logc.send_add_request({
    login: 'jefferson',
    password: '123456789987654321'},
    'philipe'
)


logc.accept_add_request({login: 'philipe', password: '987654321987654321'}, 'jefferson')

msg = {
    sender: 'jefferson',
    catcher: 'philipe',
    message: 'Hello Philipe How are you',
    topic: 'Hello from jefferson',
    type: :private
}

puts "Try send message to philipe"
p logc.send  Msg.new( msg ), {login: 'jefferson', password: '123456789987654321'}

msg = {
    sender: 'philipe',
    catcher: 'jefferson',
    message: "Hello philipe How are you",
    topic: 'Hello from philipe',
    type: :private
}

puts "Try send message to jefferson"
p logc.send  Msg.new( logc.messageRule, msg ), {login: 'philipe', password: '987654321987654312'}

puts 'Data from jefferson'
p logc.see_user_data 'jefferson', :all
puts 'Data from philipe'
p logc.see_user_data 'philipe', :all

puts "See message reveived from jefferson"
p logc.inbox_from({
    login: 'philipe',
    password: '987654321987654321'
  }, 'jefferson', :last)
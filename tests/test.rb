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


logc.register({
    login: 'jefferson',
    password: '123456789987654321'
})

logc.register({
    login: 'philipe',
    password: '987654321987654321'
})

logc.login({
    login: 'philipe',
    password: '987654321987654321'
})

logc.login({
     login: 'jefferson',
    password: '123456789987654321' # Return False. Why!?
})


logc.messageRule = {
    sender: :meta,
    catcher: :meta_catcher,
    message: String,
    topic: String,
    type: :all
}


logc.send_add_request({
    login: 'jefferson',
    password: '123456789987654321'},
    'philipe'
)


logc.accept_add_request({login: 'philipe', password: '987654321987654321'}, 'jefferson')

logc.send  Msg.new( logc.messageRule, msg ), {login: 'jefferson', password: '123456789123456789'}

logc.see_user_data 'jefferson', :all
logc.see_user_data 'philipe', :all

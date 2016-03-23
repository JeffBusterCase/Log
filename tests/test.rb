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

p logc.login({
    login: 'jefferson',
    password: '123456789987654321'
})
p logc.login({
    login: 'philipe',
    password: '987654321987654321'
})

logc.messageRule = {
    sender: :meta,
    catcher: :meta_catcher,
    message: String,
    topic: String,
    type: :all
}

p logc.send  Msg.new( logc.messageRule, msg )   

p logc.see_user_data 'jefferson', :all
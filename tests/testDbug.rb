require '../bin/log'

logc = Log.new true


logc.useDefaultRule

logc.debugger_file = "./thunbs.db"

logc.register({
    login: "jefferson",
    password: "123456789987654321"
})

logc.login({
    login: "jefferson",
    password: "123456789987654321"
})



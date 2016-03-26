require '../../bin/log'

class LogPlus
    attr_writer :meta
    attr_writer :primarKey
    
    def initialize username, password, registered=false
        @logc = Log.new
        @username = username
        @password = password
        @registered = registered
    end
    
    def normalize
        @meta = @meta.to_sym
        @primarKey = @primarKey.to_sym
        @username = @username.to_s
        @password = @password.to_s
    end


    def online?
        return @logc.isOnline? @username 
    end
        
    def register
        @logc.register({
            @meta => @username,
            @primarKey => @password
        }) if @registered
        @registered = true
    end
        
    def login
        @logc.login({
            @meta => @username,
            @primarKey => @password
        })    
    end
    
    def my thing
       @logc.see_user_data @username, thing 
    end
    def add thingk, thingv
       @logc.append_user_data @username, thingk, thingv 
    end
    
    def send message, to_who, topic="Message from #{@username}", type=:private
        msg = {
            sender: @username,
            catcher: to_who.to_s,
            message: message,
            topic: topic,
            type: type
        }
        @logc.send(Msg.new(msg), {@meta => @username, @primarKey => @password})
    end
    
    def received from_who, option=:last
        inbox_from({
            @meta => @username,
            @primarKey => @password
        }, from_who.to_s, option)
    end
end
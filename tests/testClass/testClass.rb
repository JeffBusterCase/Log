require '../../bin/log'

class LogPlus
    attr_writer :meta
    attr_writer :primarKey
    private
    attr_accessor :account_list
    public
    def initialize username, password, registered=false
        @logc = Log.new
        @logc.useDefaultRule
        @username = username
        @password = password
        @tmpP = @password
        @registered = registered
        @account_list = {}
        @account_list[@username.to_sym] = @tmpP.to_s
    end
    
    def add_account name, password
        @account_list[name.to_sym] = @tmpP.to_s if !(@account_list.include? name.to_sym)
    end
    def changeTo name
        @username = name.to_s
        @password = @account_list[@username.to_sym]
    end
    @account_list = {}
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
        # NOTE: No need normalize_
        @logc.register({
            @meta => @username,
            @primarKey => @tmpP
        }) if @registered
        @registered = true
    end

    private
    def normalize_
        @tmpP = @password
    end
    public
    def login
        normalize_
        @logc.login({
            @meta => @username,
            @primarKey => @tmpP
        })    
    end
    
    def my thing
       normalize_
       @logc.see_user_data @username, thing 
    end
    def add thingk, thingv
       normalize_
       @logc.append_user_data @username, thingk, thingv 
    end
    
    def add_friend name
        normalize_
        @logc.send_add_request({@meta => @username, @primarKey => @tmpP}, name.to_s)
    end
    def accept name
        normalize_
        p @tmpP
        p @username
        @logc.accept_add_request({@meta => @username, @primarKey => @tmpP}, name.to_s) 
    end
    def send message, to_who, topic="Message from #{@username}", type=:private
        normalize_
        
        msg = {
            sender: @username,
            catcher: to_who.to_s,
            message: message,
            topic: topic,
            type: type
        }
        @logc.send(Msg.new(msg), {@meta => @username, @primarKey => @tmpP})
    end
    
    def received from_who, option=:last
        normalize_
        
        inbox_from({
            @meta => @username,
            @primarKey => @tmpP
        }, from_who.to_s, option)
    end
end
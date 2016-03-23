class Msg
    attr_accessor :msg
    attr_accessor :messageRule_
    @messageRule_ = {
        sender: :meta,
        catcher: :meta_catcher,
        message: String,
        topic: String,
        type: :all
    }
    def initialize messageRule=@messageRule_, msg=@msg
        #Investigate the format of msg if is compatible with messageRule
        messageRule.each {|k, v|
            raise RuntimeError, "Invalid message Format. `#{k}' => `#{v}' not found" if !(msg.include? k)
        }
        
        raise RuntimeError, "Invalid format for `#{msg[:message].class}'. required a `#{messageRule[:message].class}'" if (messageRule[:message].class != msg[:message].class)
        
    end
    
    
    def crypted password
        
    end
    
    def decripted password
        
    end
end
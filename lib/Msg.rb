class Msg
    attr_accessor :msg
    attr_accessor :messageRule_
    @cipher = nil
    @messageRule_ = {
        sender: :meta,
        catcher: :meta_catcher,
        message: String,
        topic: String,
        type: :all
    }
    def initialize messageRule=@messageRule_, msg=@msg, cipher_type='AES-128-CFB'
        #Investigate the format of msg if is compatible with messageRule
        messageRule.each {|k, v|
            raise RuntimeError, "Invalid message Format. `#{k}' => `#{v}' not found" if !(msg.include? k)
        }
        
        raise RuntimeError, "Invalid format for `#{msg[:message].class}'. required a `#{messageRule[:message]}'" if (messageRule[:message] != msg[:message].class)
        
        @msg = msg if @msg == nil
        @cipher_type = cipher_type
    end
    
    
    def crypted key_and_iv
        #used in Log
        @cipher = OpenSSL::Cipher.new(@cipher_type)
        @cipher.encrypt
        @cipher.key = key_and_iv[:key]
        @cipher.iv = key_and_iv[:iv]
        @msg[:message] = @cipher.update(@msg[:message]) + @cipher.final
    end
    
    def decripted key_and_iv
        #used in Log
        @cipher = OpenSSL::Cipher.new(@cipher_type)
        @cipher.decrypt
        @cipher.key = key_and_iv[:key]
        @cipher.iv = key_and_iv[:iv]
        msg = @msg[:message]
        tmp = @cipher.update(msg) + @cipher.final
        return tmp
    end
end
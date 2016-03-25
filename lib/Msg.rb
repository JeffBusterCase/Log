class Msg
    attr_accessor :msg
    
    @cipher = nil
    
    def initialize msg=@msg, cipher_type='AES-128-CFB'
        #Investigate the format of msg if is compatible with messageRule
        @msg = msg
        
        @messageRule_ = {
            sender: :meta,
            catcher: :meta_catcher,
            message: String,
            topic: String,
            type: :all
        }#Without this here the program return bullshit(Error)
        
        @messageRule_.each {|k, v|
            raise RuntimeError, "Invalid message Format. `#{k}' => `#{v}' not found" if !(@msg.include? k)
        }
        
        raise RuntimeError, "Invalid format for `#{msg[:message].class}'. required a `#{messageRule[:message]}'" if (@messageRule_[:message] != @msg[:message].class)
        
        
        @cipher_type = cipher_type
        return true
    end

    def messageRule_
        @messageRule_
    end
    def messageRule=(hash)
        @messageRule_ = hash
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

module MSG
   def self.decrypted(msg, key_and_iv, cipher_type="AES-128-CFB")
        cipher = OpenSSL::Cipher.new(cipher_type)
        cipher.decrypt
        cipher.key = key_and_iv[:key]
        cipher.iv = key_and_iv[:iv]
        tmp = cipher.update(msg) + cipher.final
        return tmp
   end
end
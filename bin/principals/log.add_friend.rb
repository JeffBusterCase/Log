class Log
    def send_add_request login_and_password, to_who
        #login_and_password is a Alias of @meta and @primarKey
        #If add_request responde with true
        #he is added to your friend list
        #and his friend list contains you
        #so you can talk to he
        #only you and him can see the messages
        #the generated cryptographed key
        @last_login = login_and_password[@meta]
        @last_key = login_and_password[@primarKey]
        raise RuntimeError, "Invalid #{@meta} or #{@primarKey}" if !(@users.include? @last_login) &&  !(login({@meta.to_sym => @last_login, @primarKey => @last_key}))

        #Otherwise is all Ok
        append_user_data to_who.to_s, "add_request_n_#{rand(7_000_000)}", @last_login.to_s
    end
    
    
    def accept_add_request login_and_password, of_who
        #Accept add request from a user mail in your user_data
        raise RuntimeError, "You cannot add yourself to your list" if login_and_password[@meta] == of_who
        #That care of this.
        cipher = OpenSSL::Cipher.new('AES-128-CFB')
        #Be carefull otherwise users will be hacked and somebody will
        #be able to view their mesages
        key = cipher.random_key
        
        @last_login = login_and_password[@meta]
        #Make the iv be better than 16 caracteres
        iV_TAKE_CARE_OF_THIS = "#{@last_login.to_s}_#{rand(999)}_#{of_who.to_s}"
        while iV_TAKE_CARE_OF_THIS.length < 16
            iV_TAKE_CARE_OF_THIS << rand(10)
        end
        
        
        #if you want you can override and make a better from your ideas
        #But be careful here is this part
        #the login and password is really important***
        @last_key = login_and_password[@primarKey]
        raise RuntimeError, "Invalid #{@meta} or #{@primarKey}" if !(@users.include? @last_login.to_sym) &&  !(login({@meta.to_sym => @last_login, @primarKey.to_sym => @last_key}))
        puts "UserData: "
        p @userData
        # FIXME: refazer processo abaixo
        raise RuntimeError, "User already in friends list of `#{@last_login}'" if (@userData[@last_login.to_sym][:friends].include? of_who.to_sym)
        
        raise RuntimeError, "User never existed `#{of_who}'" if !(@temp.include? of_who.to_sym)
        @userData[of_who.to_sym][:friends] << {
            @meta.to_sym => @last_login.to_s,
            k: key,
            iv: iV_TAKE_CARE_OF_THIS
        }
        @userData[@last_login.to_sym][:friends] << {
            @meta.to_sym => of_who.to_s,
            k: key,
            iv: iV_TAKE_CARE_OF_THIS
        }
        return true
    end
end
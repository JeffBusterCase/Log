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
        raise RuntimeError, "Invalid #{@meta} or #{@primarKey}" if !(@users.include? @last_login) &&  !(login)

        #Otherwise is all Ok
        append_user_data to_who.to_s, "add_request_n_#{rand(7_000_000)}", @last_login.to_s
    end
    
    
    def accept_add_request login_and_password, of_who
        #Accept add request from a user mail in your user_data
        
        #if you want you can override and make a better from your ideas
        #But be careful here is this part
        #the login and password is really important***
        @last_login = login_and_password[@meta]
        @last_key = login_and_password[@primarKey]
        raise RuntimeError, "Invalid #{@meta} or #{@primarKey}" if !(@users.include? @last_login) &&  !(login)
        #That care of this.
        #Be carefull otherwise users will be hacked and somebody will
        #be able to view their mesages
        key
        
        @userData[@last_login][:friends] << {
            @meta.to_sym => of_who,
            
        }
    end
end
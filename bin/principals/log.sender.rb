class Log
    attr_accessor :messageRule
    # => Log.messageRule = {
    # =>    sender: @meta,
    # =>    catcher: @meta_catcher,
    # =>    message: @txt, #<= OTHERWISE RAISE ERROR
    # =>    topic: String, #<= Your rules
    # =>    type: :public #or :privated
    # =>    #:public type allow to post in the tumbnail
    # =>    #so the cathcer can be only one friend
    # =>    # or a array of friends
    # =>    #or the :all symbol
    # =>    #That of course is open to all your friends
    #
    # => }
    
    def send msg_class_instance, login_and_password
       
       @last_login = login_and_password[@meta.to_sym]
       @last_key = login_and_password[@primarKey.to_sym]
       
       
       # TODO: Verify if user account is true(try login)
       
       # TODO: Verify if user is online
       
       
       new_msg = {
           topic: msg_class_instance[:topic],
           msg: msg_class_instance[:message]
       }
       key = nil
       iv = nil
       @userData[@last_login.to_sym][:friends].each {|hashes|
           # TODO: PEGAR CHAVE!!! DENTRO DE FRIENDS!!!
       }
       # TODO: PEGAR CHAVE EM HASH
       k_and_iv = {
           key: key,
           iv: iv
       }
       msg = msg_class_instance.crypted(k_and_iv)
       
       for_who = msg_class_instance[:catcher]
       raise RuntimeError, "You cannot send a message with a different #{@meta.to_s} : `#{msg_class_instance[:sender]}'" if msg_class_instance[:sender] == @last_login.to_s
       @userData[for_who.to_sym][:friends][:msg_number] += 1
       @userData[for_who.to_sym][:friends][:msgs] << new_msg
       return true
    end
end
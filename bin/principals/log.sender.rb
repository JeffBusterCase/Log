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
       for_who = msg_class_instance.msg[:catcher]

       # TODO: Verify if user account is true(try login)

       # TODO: Verify if user is online


       new_msg = {
           topic: msg_class_instance.msg[:topic],
           msg: msg_class_instance.msg[:message]
       }
       key = nil
       iv = nil
       @userData[@last_login.to_sym][:friends].each {|hashes|
           # TODO: PEGAR CHAVE!!! DENTRO DE FRIENDS!!!
           if hashes[@meta.to_sym].to_s == for_who.to_s
             key = hashes[:k]
             iv = hashes[:iv]
           else
             raise RuntimeError, "Something goes really wrong, seems that you do not have the permission to send message to that person"
           end
       }
       # TODO: PEGAR CHAVE EM HASH
       k_and_iv = {
           key: key,
           iv: iv
       }
       #Crypt the msg
       msg_class_instance.crypted(k_and_iv)
       new_msg[:msg] = msg_class_instance.msg

       raise RuntimeError, "You cannot send a message with a different #{@meta.to_s} : `#{msg_class_instance[:sender]}'" if msg_class_instance.msg[:sender] != @last_login.to_s
       stmp = 0
       @userData[for_who.to_sym][:friends].each {|hashes|
           if hashes[@meta.to_sym].to_s == @last_login.to_s
             @userData[for_who.to_sym][:friends][stmp][:msg_number] += 1
             @userData[for_who.to_sym][:friends][stmp][:msgs] << new_msg
           else
             raise RuntimeError, "Something goes really wrong, seems that you do not have the permission to send message to that person"
           end
           stmp += 1
       }
       return true
    end
end

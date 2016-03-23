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
    
    def send msg_class_instance
       
    end
end
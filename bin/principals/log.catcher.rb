class Log

  def inbox login_and_password
    # => Return list of messages
    #
    @last_login = login_and_password[@meta.to_sym]
    @last_key = login_and_password[@primarKey.to_sym]

    # TODO: verify if the login and password is correct

    # NOTE: verify if is online
    raise RuntimeError, "Use not even is online" if !(@users.include? @last_login.to_sym)
    arr = [{}]
    stmp = 0
    @userData[@last_login][:friends].each {|hashes|
      arr[stmp][:from] = hashes[@meta.to_sym]
      arr[stmp][:msgs_number] = hashes[:msg_number]
      stmp += 1
    }
    return arr
  end

  # => Return determined message from determined person
  def inbox_from login_and_password, person_name, option=:all, subOption=nil
    # => :all #+>All from  that person
    # => :last #+> Last from that person
    # => :first #+> First from that person
    # => :where #+> Need sub option with the txt to search in the messages
    # if option is :where then subOption is needed
    # => inbox_from({login: 'fulano', password: 'siclano'}, 'primoFulano', :where, "jasons phone is")
    
    @last_login = login_and_password[@meta.to_sym]
    @last_key = login_and_password[@primarkey]
    
    
    # TODO: Verify if login is correct
    
    # TODO: Verify if user is Online
    
    case option.to_sym
    when :all
      return @userData[@last_login.to_sym][:friends]
    when :last
      @userData[@last_login.to_sym][:friends].each {|hashes|
        if hashes[@meta.to_sym].to_s == person_name.to_s
          _last = hashes[:msgs].last #Duplicated topic!!!!! delete one of they
          p _last
          return MSG.decrypted(_last[:msg][:message], {key: hashes[:k], iv: hashes[:iv]})
        end
      }
      
    when :first
    when :where
    else
      raise RuntimeError, "Undefined option #{option}.to_sym"
    end
  end
end

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
    # => :all
    # => :last
    # => :first
    # => :where
    # if option is :where then subOption is needed
    # => inbox_from({login: 'fulano', password: 'siclano'}, 'primoFulano', :where, "jasons phone is")

  end
end

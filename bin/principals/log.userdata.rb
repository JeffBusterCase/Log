class Log
  attr_reader :users
  def isOnline? user
    @users.include? user.to_sym 
  end
  
  
  def append_user_data user, boxname, message#Or text
      if isOnline? user
        @userData[user.to_sym][boxname.to_sym] = message
      else 
        return false
      end
  end
  
  
  def see_user_data user, boxname
    if boxname.to_sym == :all
      return @userData[user.to_sym]
    else
      return @userData[user.to_sym][boxname.to_sym]
    end
  end
end

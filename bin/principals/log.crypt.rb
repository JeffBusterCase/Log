class Log
  @primarKey = :password
  # NOTE: If no option given, crypt temp
  private
  def crypt
    cipher = OpenSSL::Cipher.new('AES-128-CFB')
    if @last_key.length >= 16
      # TODO: cryptograpth
      cipher.encrypt
      cipher.key = @last_key
      cipher.iv = @last_key
      @temp[@last_login][@primarKey] = cipher.update(@last_key) + cipher.final
      log_debug "Registered #{@temp[@last_login][@meta]} as " # as (username)
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end

  def decrypt
    decipher = OpenSSL::Cipher.new('AES-128-CFB')
    if @last_key.length >= 16
      # TODO: descryptograpth
      decipher.key = @last_key
      decipher.iv = @last_key
      a = (decipher.update(@temp[@last_login][@primarKey]) + decipher.final)
      log_debug "Log of #{@last_login} at #{Time.now}"
      return a
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end
end

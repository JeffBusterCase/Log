class Log
  @primarKey = :password
  # NOTE: If no option given, crypt temp
  private
  def crypt
    cipher = OpenSSL::Cipher.new('AES-128-CFB')
    if @last_login[@primarKey].length >= 16
      # TODO: cryptograpth
      cipher.encrypt
      cipher.key = @last_login[@primarKey]
      @last_login[@primarKey] = cipher.update(@last_login[@primarKey]) + cipher.final
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end

  def decrypter data
    decipher = OpenSSL::Cipher.new('AES-128-CFB')
    if @last_log.length >= 16
      # TODO: descryptograpth
      decipher.key = @last_log[@primarKey]
      return (decipher.update(@temp[@last_login][@primarKey]) + decipher.final)
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end
end

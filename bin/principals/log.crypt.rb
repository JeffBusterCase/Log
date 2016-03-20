class Log
  @primarKey = :password
  # NOTE: If no option given, crypt temp
  private
  def crypt
    cipher = OpenSSL::Cipher.new('AES-128-CFB')
    p @last_key
    if @last_key.length >= 16
      # TODO: cryptograpth
      cipher.encrypt
      cipher.key = @last_key
      @temp[@last_login][@primarKey] = cipher.update(@last_key) + cipher.final
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end

  def decrypter data
    decipher = OpenSSL::Cipher.new('AES-128-CFB')
    if @last_key.length >= 16
      # TODO: descryptograpth
      decipher.key = @last_key
      return (decipher.update(@temp[@last_login][@primarKey]) + decipher.final)
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end
end

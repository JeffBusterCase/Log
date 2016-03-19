class Log
  @primarKey = :password
  # NOTE: If no option given, crypt temp
  private
  def crypt
    cipher = OpenSSL::Cipher.new('AES-128-CFB')
    if @temp[@last_login][@primarKey].length >= 16
      # TODO: cryptograpth
      cipher.encrypt
      cipher.key = @temp[@last_login][@primarKey]
      @temp[@last_login][@primarKey] = cipher.update(@temp[@last_login][@primarKey]) + cipher.final
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end
  def decrypter data
    decipher = OpenSSL::Cipher.new('AES-128-CFB')
    if @last_login[@primarKey].length >= 16
      # TODO: descryptograpth
      decipher.key = @last_login[@primarKey]
      return  decipher.update() + decipher.final
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end
end

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
      puts "Answered with: " + a.to_s
      return a
    else
      raise "Key.length too short\nMinimum of '16' caracters"
    end
  end
end

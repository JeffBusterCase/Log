class Log
  #--Register--
  attr_accessor :registerRule
  attr_writer :registerKey_len
  # Example:
  # => instance.registerRule = {
  # =>     login: String,
  # =>     password: String,
  # =>     primarKey: :password
  # =>     not: {password: "!#&\'*.(){[-_+=]}",
  # =>             login: etc
  # =>     }           #<= This need to be writed totaly correct
  #
  #
  # => }
  @error = false
  def register primarLabel, v #v must be a hash
    #analisar e ver se está da forma correta
    error = false
    #Are in the correct form?
    v.each {|k, val|
      if !(@registerRule.include? k)
        raise "Warning:\nInvalid input tag '#{k}'!"
        error = true
      end
    }
    #Not contain proibited caracters?
    if @registerRule.include? :not
      @registerRule[:not].each { |k, val|
        val.split('').each { |char|
          if v[k] != nil
            if v[k].include? char
              raise "Warning: Invalid Input in '#{k} => #{v[k]}'. Input cannot include #{@registerRule[:not][k].split('').join(', ')}."
              error = true if v[k].include? char
            end
          end
        }
      }
    end
    #Who is the primarKey?
    @primarKey = v[:primarKey] if v.include? :primarKey #Else primarKey = :password
    @last_login = primarLabel.to_sym
    @temp[primarLabel.to_sym] = v if !error
    self.crypt#Call Cipher and cipher the primarKey
    return true if !error
  end
end

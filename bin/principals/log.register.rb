class Log
  #--Register--
  attr_reader :registerRule
  def registerRule=x
    @registerRule = x
    #Who is the primarKey?
    @primarKey = @registerRule[:primarKey] if @registerRule.include? :primarKey #Else primarKey = :password
    @meta = @registerRule[:meta]
  end
  def useDefaultRule
    @registerRule[:login] = String
    @registerRule[:password] = String
    @registerRule[:meta] = "login".to_sym
    @meta = "login".to_sym
    @primarKey = "password".to_sym
    @registerRule[:primarKey] = "password".to_sym
    @registerRule[:not] = {
      login: Default[:badChars],
      password: Default[:badChars]}
  end
  @last_key = nil
  @last_login = nil
  # Example:
  # => instance.registerRule = {
  # =>     login: String,
  # =>     password: String,
  # =>     primarKey: :password,
  # =>     meta: :login,
  # =>     not: {password: "!#&\'*.(){[-_+=]}",
  # =>             login: etc
  # =>     }           #<= This need to be writed totaly correct
  #
  #
  # => }
  @error = false
  def register v #v must be a hash
    #analisar e ver se está da forma correta
    v.each {|key_chave, value_valor|
      raise InvalidInputException, "Undefined `:#{key_chave}'. Required> `:#{@meta}' <&> `:#{@primarKey}'<end" if !(@registerRule.include? key_chave)
    }
    raise RuleNotDefinedException, "registerRule not defined yet!****" if @registerRule == nil
    error = false
    #Not contain proibited caracters?
    if @registerRule.include? :not
      @registerRule[:not].each { |k, val|
        val.split('').each { |char|
          if v[k] != nil
            if v[k].include? char
              raise InvalidInputException, "Warning: Invalid Input in '#{k} => #{v[k]}'. Input cannot include #{@registerRule[:not][k].split('').join(', ')}."
              error = true if v[k].include? char
            end
          end
        }
      }
    end
    @last_key = v[@registerRule[:primarKey].to_s.to_sym]
    @last_login = v[@registerRule[:meta].to_s.to_sym].to_sym
    @temp[@last_login] = v if !error
    crypt#Call Cipher and cipher the primarKey
    return true if !error
  end
end

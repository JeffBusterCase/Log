class Log
  #--Register--
  attr_reader :registerRule
  def registerRule=x
    @registerRule = x
    #Who is the primarKey?
    @primarKey = @registerRule[:primarKey] if @registerRule.include? :primarKey #Else primarKey = :password
    @meta = @registerRule[:meta]
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
    @last_key = v[@primarKey]
    @last_login = v[@meta].to_sym
    @temp[@last_login] = v if !error
    crypt#Call Cipher and cipher the primarKey
    return true if !error
  end
end

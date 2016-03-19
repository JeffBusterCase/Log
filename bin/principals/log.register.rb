class Log
  #--Register--
  attr_accessor :registerRule
  # Example:
  # => instance.registerRule = {
  # =>     login: String,
  # =>     password: String,
  # =>     not: {password: "!#&\'*.(){[-_+=]}",
  # =>             login: etc
  # =>     }           #<= This need to be writed totaly correct
  #
  #
  # => }
  @error = false
  def register primarKey, v #v must be a hash
    #analisar e ver se está da forma correta
    error = false
    #Are in the correct form?
    v.each {|k, val|
      if !(@registerRule.include? k)
        $stdout.puts "Warning:\nInvalid input tag '#{k}'!"
        error = true
      end
    }
    #Not contain proibited caracters?
    if @registerRule.include? :not
      @registerRule[:not].each { |k, val|
        val.split('').each { |char|
          if v[k] != nil
            if v[k].include? char
              $stdout.puts "Warning:",
                           " Invalid Input in '#{k} => #{v[k]}'. Input cannot include #{@registerRule[:not][k].split('').join(', ')}."
              error = true if v[k].include? char
            end
          end
        }
      }
    end

    @temp[primarKey.to_sym] = v if !error
    return true if !error
  end
end

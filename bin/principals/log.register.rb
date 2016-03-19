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
  def register primaryKey, v #v must be a hash
    #analisar e ver se está da forma correta

    if v[:not].defined?
      v[:not].each { |k, val|
        val.each_char { |char|
          $stdout.puts "Invalid Input in '#{k} => #{v[k]}'. Input cannot include #{v[:not][k].join(', ')}." if v[k].include? char
          @error = true if v[k].include? char
        }
      }
    end

    @temp[primaryKey.to_sym] = value if !@error
  end
  def login

  end
end

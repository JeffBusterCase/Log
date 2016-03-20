class Log
  @last_login = nil
  @last_log = nil
  def login loging #log is a hash with the corrects requesteds inputs
    raise RuleNotDefinedException, "registerRule not defined yet!****" if @registerRule == nil

    loging.each {|key_chave, value_valor|
      raise InvalidInputException, "Undefined `:#{key_chave}'. Required> `:#{@meta}' <&> `:#{@primarKey}'<end" if !(@registerRule.include? key_chave)
    }
    @last_log = loging
    @last_login = loging[@meta].to_sym
    willReturnTrue = false
    if !@databaseBanc
      if @temp.include? loging[@meta].to_sym
        stored_key = decrypt
        willReturnTrue = true if loging[@primarKey] == stored_key

      end
      return willReturnTrue
    else
    #----------------------------------
    # TODO: Analise if are in database using in DataBanc
    return false #Because of TODO
    end
  end
end

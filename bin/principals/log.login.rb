class Log
  @last_login = nil
  @last_log = nil
  def login loging #log is a hash with the corrects requesteds inputs
    @last_log = loging
    @last_login = loging[@meta].to_sym
    willReturnTrue = false
    if !@databaseBanc
      puts "No databaseBanc"
      if @temp.include? loging[@meta].to_sym
        puts "Yes include"
        stored_key = decrypt
        willReturnTrue = true if loging[@primarKey] == stored_key
        p loging
        puts loging[@primarKey],
             "para",
             decrypt
      end
      return willReturnTrue
    else
    #----------------------------------
    # TODO: Analise if are in database using in DataBanc
    return false #Because of TODO
    end
  end
end

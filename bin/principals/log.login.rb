class Log
  @last_login = nil
  @last_log = nil
  def login log #log is a hash with the corrects requesteds inputs
    @last_log = log
    willReturnTrue = false
    if !@databaseBanc
      if @temp.include? log[@meta]
        willReturnTrue = true if log[@primarKey] == self.decrypt(@temp[@meta][@primarKey])#Está criptographada
      end
      return willReturnTrue
    else
    #----------------------------------
    # TODO: Analise if are in database using in DataBanc
    return false #Because of TODO
    end
  end
end

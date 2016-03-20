class Log
  @last_login = nil
  def login log #log is a hash with the corrects requesteds inputs
    willReturnTrue = false
    if !@databaseBanc
      @temp[@registerRule[@last_login[]]][@registerRule[@primarKey]]
      @temp.each { |ky, vl|
        @temp[ky].each {|ch, valor|
          willReturnTrue = true if log[ch] == self.decrypt(log[ch])
        }
      }
      return willReturnTrue
    else
    #----------------------------------
    # TODO: Analise if are in database using in DataBanc
    end
  end
end

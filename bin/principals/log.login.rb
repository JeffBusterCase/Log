class Log
  def login log #log is a hash with the corrects requesteds inputs
    willReturnTrue = false
    if !@databaseBanc
      @temp.each { |ky, vl|
        @temp[ky].each {|ch, valor|
          willReturnTrue = true if log[ch] == valor
        }
      }
      return willReturnTrue
    else
    #----------------------------------
    # TODO: Analise if are in database using in DataBanc
    end
  end
end

#
# => Account Class
# => Create Accounts
#
class Log
  # => Instantiate
  def initialize databaseBanc=false
    @databaseBanc = DataBanc.new if !databaseBanc 
    @databaseBanc = false if !databaseBanc
    @temp = {} if !databaseBanc
    @registerRule = {}
  end

end

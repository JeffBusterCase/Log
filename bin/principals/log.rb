#
# => Account Class
# => Create Accounts
#
class Log
  # => Instantiate
  def initialize debug=false, databaseBanc=false
    @debug = false if !debug
    @databaseBanc = DataBanc.new if !databaseBanc 
    @databaseBanc = false if !databaseBanc
    @temp = {} if !databaseBanc
    @registerRule = {}
    @debugger_file = "../../debug/log"
  end

end

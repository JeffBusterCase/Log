#
# => Account Class
# => Create Accounts
#
class Log
  # => Instantiate
  def initialize debug=false, databaseBanc=false
    @debug = debug #Only will append text after Log.create()
    @databaseBanc = DataBanc.new if !databaseBanc 
    @databaseBanc = databaseBanc
    @temp = {} if !databaseBanc
    @userData = {} if !databaseBanc
    @users = [] if !databaseBanc
    @registerRule = {}
    @debugger_file = nil
  end

end

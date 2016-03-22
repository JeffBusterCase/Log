#
# => Account Class
# => Create Accounts
#
class Log
  # => Instantiate
  def initialize debug=false, databaseBanc=false
    @debug = false if !debug #Only will append text after Log.create()
    @databaseBanc = DataBanc.new if !databaseBanc 
    @databaseBanc = false if !databaseBanc
    @temp = {} if !databaseBanc
    @registerRule = {}
  end

end

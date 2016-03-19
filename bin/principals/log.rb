#
# => Account Class
# => Create Accounts
#
class Log
  # => Instantiate
  def initialize databaseBanc=false
    @databaseBanc = DataBanc.new if databaseBanc != false
    @databaseBanc = false if databaseBanc == false
  end

end

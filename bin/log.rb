require_relative "./principals/log"

#Require It self
["constants",
 "create",
 "crypt",
 "login",
 "register",
 "userdata"].each { |lib|
   require_relative "./principals/log.#{lib}"
 }
 #Require Database
["config",
 "create",
 "new",
 "table.new.rb"].each { |lib|
   require_relative "../databanc/log.databanc.#{lib}"
 }

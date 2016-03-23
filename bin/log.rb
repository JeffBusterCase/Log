require_relative "./principals/log"
require 'openssl'
#Require It self
["constants",
 "tempdatabase",
 "logout",
 "debug",
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
 #Require Library
 ["cortez", 
  "Msg"].each { |lib|
   require_relative "../lib/#{lib}"
 }
 include Log_Constants

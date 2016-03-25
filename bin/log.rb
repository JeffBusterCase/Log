print "\nRequiring initialize class log..."
print (require_relative "./principals/log")? "OK\n" : "NO\n"

print "Requiring OpenSSL..."
print (require 'openssl')? "OK\n" : "NO\n"
#Require It self
["constants",
 "tempdatabase",
 "add_friend",
 "sender",
 "catcher",
 "logout",
 "debug",
 "create",
 "crypt",
 "login",
 "register",
 "userdata"].each { |lib|
   print "Requiring #{lib}..."
   print (require_relative "./principals/log.#{lib}")? "OK\n" : "NO\n"
   
 }
 #Require Database
["config",
 "create",
 "new",
 "table.new.rb"].each { |lib|
   print "Requiring #{lib}..."
   print (require_relative "../databanc/log.databanc.#{lib}")? "OK\n" : "NO\n"
 }
 #Require Library
 ["cortez", 
  "Msg"].each { |lib|
   print "Requiring #{lib}..."
   print (require_relative "../lib/#{lib}")? "OK\n" : "NO\n"
 }
 print "Including Constants..."
 include Log_Constants
 print "OK\nFinished\n\n"
 

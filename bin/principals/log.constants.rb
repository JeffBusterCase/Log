module Log_Constants
  Default = {
    badChars: "!#$%¨&*( );:/\\,<>'\"][{}ºª°|-+=`^´"
  }
end
class Log
  #CONSTANTS
  Log_Created = false
  
  
  
  #Errors
  class Error < RuntimeError
  end
  class RuleNotDefinedException < Error
  end
  class InvalidInputException < Error
  end
end

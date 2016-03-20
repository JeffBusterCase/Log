module Log_Constants
  Default = {
    badChars: "!#$%¨&*( );:/\\,<>'\"][{}ºª°|-+=`^´"
  }
end
class Log
  #Errors
  class Error < RuntimeError
  end
  class RuleNotDefinedException < Error
  end
  class InvalidInputException < Error
  end
end

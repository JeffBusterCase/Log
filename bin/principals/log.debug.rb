class Log
    @debug = true
    attr_writer :debugger_file
    def log_debug word
        if @debug && Log_Created && (@debugger_file.is_a(String))
            tmp = File.read(@debugger_file)
            File.open(@debugger_file, "w"){|f|
                f.puts (tmp << word + " at Year: #{ Time.now.year} Month: #{Time.now.month} Day: #{Time.now.day} Hour: #{Time.now.hour}:#{Time.now.min}:#{ Time.now.sec}")
            }
        elsif @debugger_file == $stdout 
            @debugger_file.puts word
        elsif @debugger_file == nil
            nil
        else 
            tmp = File.read(@debugger_file)
            File.open(@debugger_file, "w"){|f|
                f.puts (tmp << "#{word}")    
            }
        end
        word
    end
end
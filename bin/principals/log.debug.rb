class Log
    @debug = true
    attr_writer :debugger_file
    def log_debug word
        if @debug
            File.open(@debugger_file, "a"){|f|
                f.puts word + " at Year: #{ Time.now.year} Month: #{Time.now.month} Day: #{Time.now.day} Hour: #{Time.now.hour}:#{Time.now.min}:#{ Time.now.sec}"
            }
        end
        word
    end
end
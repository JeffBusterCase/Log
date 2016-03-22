class Log
    def logout user
        @users.delete user.to_sym if @users.include? user.to_sym
    end
end
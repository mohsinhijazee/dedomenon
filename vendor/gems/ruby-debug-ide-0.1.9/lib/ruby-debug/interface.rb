module Debugger  

  class RemoteInterface # :nodoc:

    def initialize(socket)
      @socket = socket
    end
    
    def read_command
      result = @socket.gets
      raise IOError unless result
      result.chomp
    end

    def print(*args)
      @socket.printf(*args)
    end
    
    def close
      @socket.close
    rescue Exception
    end
    
  end
  
end

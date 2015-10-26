module SuperTailer
  class Base
    attr_accessor :origin
    attr_accessor :seek_start
    attr_accessor :sleep_interval

    def initialize(file, sleep_interval = 0.1, seek_start = File::SEEK_END)
      self.seek_start = seek_start
      self.origin = initialize_origin(file)
      self.sleep_interval = sleep_interval
    end

    private

    def initialize_origin(file_path)
      File.new(file_path).tap do |file|
        file.seek(0, seek_start)
      end
    end

    def tailer
      begin
        yield(origin.readline)
      rescue EOFError
        origin.seek(0, File::SEEK_CUR)
        sleep(sleep_interval)
      end
    end
  end
end

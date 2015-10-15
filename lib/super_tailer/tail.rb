module SuperTailer
  class Tail < SuperTailer::Base
    def watch
      loop do
        tailer { |line| yield(line) }
      end
    end
  end
end

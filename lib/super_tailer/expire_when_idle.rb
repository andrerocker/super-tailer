require 'timers'

module SuperTailer
  class ExpireWhenIdle < SuperTailer::Base
    def watch(timeout)
      watching = { enable: true }
      chrono = timer(timeout) { watching[:enable] = false }

      while watching[:enable] do
        tailer do |line|
          yield(line)
          chrono.reset
        end
      end
    end

    private
    def timer(seconds, &blk)
      timers = Timers::Group.new
      chrono = timers.after(seconds, &blk)
      Thread.new { timers.wait }
      chrono
    end
  end
end

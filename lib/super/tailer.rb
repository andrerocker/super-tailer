require "super/tailer/version"

module Super
  module Tailer
    extend self

    def watch(current)
      file = File.new(current)
      file.seek(0, File::SEEK_END)

      loop do
        begin
          puts file.readline
        rescue EOFError
          file.seek(0, File::SEEK_CUR)
          sleep 0.1
        end
      end
    end
  end
end

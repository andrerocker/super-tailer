require "super/tailer/version"

module Super
  module Tailer
    extend self

    def watch(content_file)
      file = File.new(content_file)
      file.seek(0, File::SEEK_END)

      loop do
        begin
          yield
          file.readline
        rescue EOFError
          file.seek(0, File::SEEK_CUR)
          sleep 0.1
        end
      end
    end
  end
end

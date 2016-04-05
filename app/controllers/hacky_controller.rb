# The stuff that should be summarily deleted
class HackyController < ApplicationController
  def stat
    stat_script = Rails.root.join("stats.sh")
    if stat_script.executable?
      r,w = IO.pipe
      pid = spawn stat_script.to_s, :out => w, :err => w, :in => "/dev/null"
      w.close

      self.response_body = Rack::Chunked::Body.new(CommandOutput.new(:pid => pid, :out => r))
      response.headers["Content-Type"] = "text/plain"
      response.headers["Cache-Control"] = "no-cache"
      response.headers["Transfer-Encoding"] = "chunked"
    else
      render :status => 404, :text => "not found\r\n"
    end
  end

  class CommandOutput
    def initialize(options)
      @pid = options.fetch(:pid)
      @out = options.fetch(:out)
    end

    def each
      status = Process.waitpid @pid, Process::WNOHANG
      until @out.eof?
        yield @out.readpartial(1024*1024)
        status ||= Process.waitpid @pid, Process::WNOHANG
      end
      @status ||= Process.waitpid @pid
      nil
    end
  end
end

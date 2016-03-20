class HomeController < ApplicationController
  def dashboard
    @host = Host.new(ip: request.ip)
  end
end

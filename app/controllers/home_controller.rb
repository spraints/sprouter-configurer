class HomeController < ApplicationController
  def dashboard
    @host = Host.for_request(request)
  end

  def friend
    @host = Host.new(ip: params[:addr])
    render action: "dashboard"
  end

  def sprouter_config
    render :text => SprouterConfig.new(Host.all), :content_type => "text/plain"
  end

  def set_mode
    routing_request = RoutingChange.build \
      request: request,
      attrs: params.permit(:ip, :requested_mode, :duration)
    routing_request.save!
    if params[:ip].present?
      redirect_to action: "friend", addr: params[:ip]
    else
      redirect_to action: "dashboard"
    end
  end
end

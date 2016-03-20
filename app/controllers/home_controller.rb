class HomeController < ApplicationController
  def dashboard
    @host = Host.for_request(request)
  end

  def set_mode
    routing_request = RoutingChange.build \
      request: request,
      attrs: params.permit(:requested_mode, :duration)
    routing_request.save!
    redirect_to action: "dashboard"
  end
end

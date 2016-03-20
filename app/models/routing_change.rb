class RoutingChange
  def self.build(request:, attrs:)
    host = Host.for_request(request)
    routing_request = host.requests.build
    routing_request.requested_by = request.ip
    routing_request.requested_mode = ConnectionMode.new(attrs[:requested_mode])
    routing_request.until = parse_duration(attrs[:duration]).from_now
    routing_request
  end

  private

  def self.parse_duration(duration)
    case duration
    when /\A(\d+)(h|hour|hours)\z/
      $1.to_i.hours
    when /\A(\d+)(d|day|days)\z/
      $1.to_i.days
    else
      1000.years
    end
  end
end

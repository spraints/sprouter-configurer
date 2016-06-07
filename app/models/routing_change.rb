class RoutingChange
  def self.build(request:, attrs:)
    host = attrs[:ip] ? Host.new(ip: attrs[:ip]) : Host.for_request(request)
    routing_request = host.requests.build
    routing_request.requested_by = request.ip
    routing_request.requested_mode = ConnectionMode.new(attrs[:requested_mode])
    routing_request.until = parse_duration(attrs[:duration]).from_now
    routing_request
  end

  private

  def self.parse_duration(duration)
    case duration
    when /\A(\d+)(m|min|minute|minutes)\z/
      $1.to_i.minutes
    when /\A(\d+)(h|hour|hours)\z/
      $1.to_i.hours
    when /\A(\d+)(d|day|days)\z/
      $1.to_i.days
    else
      1000.years
    end
  end
end

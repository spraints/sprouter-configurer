class Host
  def self.all
    RoutingRequest.uniq.pluck(:ip).map { |ip| new(ip: ip) }
  end

  def self.for_request(request)
    new(ip: request.ip)
  end

  def initialize(ip:)
    @ip = ip
  end

  attr_reader :ip

  def connection_mode
    ConnectionMode.new(active_requests.first.try(:requested_mode))
  end

  def active_requests
    @active_requests ||= requests.select { |req| req.until.nil? || req.until > Time.now }
  end

  def requests
    @requests ||= RoutingRequest.for_ip(ip)
  end
end

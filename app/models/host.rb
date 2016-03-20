class Host
  def initialize(ip:)
    @ip = ip
  end

  attr_reader :ip

  def connection_mode
    connection_mode_class.new
  end

  def connection_mode_class
    case active_requests.first.try(:requested_mode)
    when "preferred"
      ConnectionMode::Preferred
    when "turbo"
      ConnectionMode::Turbo
    else
      ConnectionMode::Normal
    end
  end

  def active_requests
    @active_requests ||= requests.select { |req| req.until.nil? || req.until > Time.now }
  end

  def requests
    @requests ||= RoutingRequest.for_ip(ip)
  end
end

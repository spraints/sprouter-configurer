class RoutingRequest < ApplicationRecord
  default_scope { order("id DESC") }
  scope :for_ip, ->(ip) { where ip: ip }

  def duration
    self.until.to_s
  end
end

class RoutingRequest < ApplicationRecord
  default_scope { order("id DESC") }
  scope :for_ip, ->(ip) { where ip: ip }
end

require 'test_helper'

class HostTest < ActiveSupport::TestCase
  def mode_for(ip)
    Host.new(ip: ip).mode
  end

  test "default mode" do
    assert_equal Mode::Normal, mode_for("172.16.1.1")
  end

  test "mode selected" do
    TimeCop.freeze("2016-01-01 12:12:12") do
      request_mode ip: "172.16.1.1", mode: "turbo", until: "2017-01-01 12:12:12"
    end
    assert_equal Mode::
  end
  # test "the truth" do
  #   assert true
  # end
end

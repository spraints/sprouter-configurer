# The stuff that should be summarily deleted
class HackyController < ApplicationController
  def stat
    render :text => <<STAT, :content_type => "text/plain"
==
df
--
#{`df`}

======
Tables
------
#{`pfctl -vv -s Tables 2>&1`}

=======
traffic
-------
#{`tail -f /var/lib/collectd/csv/zig-or-att/interface-re*/if_{octets,packets}-#{Time.now.strftime("%Y-%m-%d")} 2>&1`}

STAT
  end
end

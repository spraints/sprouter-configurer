# The stuff that should be summarily deleted
class HackyController < ApplicationController
  def stat
    stat_script = Rails.root.join("stats.sh")
    if stat_script.executable?
      render :text => `#{stat_script} 2>&1`, :content_type => "text/plain"
    else
      render :status => 404, :text => "not found\r\n"
    end
  end
end

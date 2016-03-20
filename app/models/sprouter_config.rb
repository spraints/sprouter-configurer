class SprouterConfig
  def initialize(hosts)
    @hosts = hosts
  end

  attr_reader :hosts

  def to_s
    turbo_hosts_config + preferred_hosts_config
  end

  private

  def turbo_hosts_config
    config_section "turbo_hosts", ConnectionMode::Turbo
  end

  def preferred_hosts_config
    config_section "preferred_hosts", ConnectionMode::Preferred
  end

  def config_section(section_name, connection_mode_class)
    hosts_with_mode = hosts.select { |host| host.connection_mode.is_a?(connection_mode_class) }
    if hosts_with_mode.any?
      hosts_with_mode.inject("#{section_name}:\n  pfthing:\n") do |config, host|
        config + "  - #{host.ip}\n"
      end
    else
      ""
    end
  end
end

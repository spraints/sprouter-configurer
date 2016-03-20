module ConnectionMode
  def self.new(mode_name)
    mode_class =
      case mode_name
      when Preferred::NAME
        Preferred
      when Turbo::NAME
        Turbo
      else
        Normal
      end
    mode_class.new
  end

  class Normal
    NAME = "normal"
    DESCRIPTION = "Your computer gets a slow connection, always."
    def to_s; NAME; end
  end

  class Preferred
    NAME = "preferred"
    DESCRIPTION = "Your computer gets a fast connection, if the slow connection is poor."
    def to_s; NAME; end
  end

  class Turbo
    NAME = "turbo"
    DESCRIPTION = "Your computer gets a fast connection."
    def to_s; NAME; end
  end
end

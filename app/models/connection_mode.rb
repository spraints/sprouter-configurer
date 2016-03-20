module ConnectionMode
  class Normal
    NAME = "normal"
    DESCRIPTION = "Your computer gets a slow connection, always."

    def to_s; "normal"; end
  end

  class Preferred
    NAME = "preferred"
    DESCRIPTION = "Your computer gets a fast connection, if the slow connection is poor."
    def to_s; "preferred"; end
  end

  class Turbo
    NAME = "turbo"
    DESCRIPTION = "Your computer gets a fast connection."
    def to_s; "turbo"; end
  end
end

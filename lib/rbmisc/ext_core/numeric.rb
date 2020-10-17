# Extend Numeric class, ancestor of Float and Integer
class Numeric
  def percent
    self.fdiv(100)
  end

  def to_pcnt
    self * 100
  end
end

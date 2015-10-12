class SafetyRange
  def initialize lower_threshold, higher_threshold
    @lower_threshold = lower_threshold
    @higher_threshold = higher_threshold
  end

  def includes? value
    value < @lower_threshold || @higher_threshold < value
  end
end
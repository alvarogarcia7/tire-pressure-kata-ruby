require_relative './sensor'
require_relative './safety_range'

class Alarm
  attr_reader :alarm_on

  def self.create_pressure_alarm
    create_alarm(Sensor.new, SafetyRange.new(17, 21))
  end

  def self.create_alarm sensor, safety_range
    new(sensor, safety_range)
  end

  def initialize sensor, safety_range
    @sensor = sensor
    @alarm_on = false
    @safety_range = safety_range
  end

  def check
    sampled_value = @sensor.sample_value()
    @alarm_on = true if @safety_range.includes?(sampled_value)
  end
end

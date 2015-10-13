require_relative './sensor'

class Alarm

  attr_reader :alarm_on

  def initialize
    @sensor = Sensor.new
    @alarm_on = false
  end

  def check
    pressure = sample_pressure

    @alarm_on = true if pressure < LOW_PRESSURE || HIGH_PRESSURE < pressure
  end

  def sample_pressure
    #Confirmed: explanations#10
    pressure = @sensor.pop_next_pressure_psi_value()
  end

  private

  LOW_PRESSURE = 17
  HIGH_PRESSURE = 21
end
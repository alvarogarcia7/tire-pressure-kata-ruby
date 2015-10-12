require_relative '../lib/alarm'

describe Alarm do
  it "is on when pressure is too low" do
    alarm = Alarm.new
    alarm.set_sensor(FakeSensor.new(15))

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end
end

class Alarm
  def set_sensor sensor
    @sensor = sensor
  end
end

class FakeSensor
  def initialize value
    @value = value
  end

  def pop_next_pressure_psi_value
    @value
  end
end

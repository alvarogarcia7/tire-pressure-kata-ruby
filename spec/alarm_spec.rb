require_relative '../lib/alarm'

describe Alarm do
  it "is on when pressure is too low" do
    alarm = alarm_with_sensor_sampling(15)

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end

  it "is off when pressure is in the safety range" do
    alarm = FakeAlarm.new(18)

    alarm.check

    expect(alarm.alarm_on).to be_falsey
  end

  it "is on when pressure is too high" do
    alarm = FakeAlarm.new(22)

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end
end

class FakeAlarm < Alarm
  def initialize value
    @value = value
  end

  def sample_pressure
    @value
  end
end

def sensor_sampling(value)
  sensor = double()
  allow(sensor).to receive(:pop_next_pressure_psi_value) { value }
  sensor
end


def alarm_with_sensor_sampling(value)
  sensor = sensor_sampling(value)
  Alarm.create_alarm(sensor)
end

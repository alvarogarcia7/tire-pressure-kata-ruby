require_relative '../lib/alarm'

describe Alarm do
  it "is on when sampled value is too low" do
    alarm = alarm_with_sensor_sampling(15)

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end

  it "is off when sampled value is in the safety range" do
    alarm = alarm_with_sensor_sampling(18)

    alarm.check

    expect(alarm.alarm_on).to be_falsey
  end

  it "is on when sampled value is too high" do
    alarm = alarm_with_sensor_sampling(22)

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end
end

def sensor_sampling(value)
  sensor = double()
  allow(sensor).to receive(:sample_value) { value }
  sensor
end

def alarm_with_sensor_sampling(value)
  sensor = sensor_sampling(value)
  Alarm.create_alarm(sensor, SafetyRange.new(17, 21))
end

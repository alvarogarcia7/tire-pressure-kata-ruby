require_relative '../lib/alarm'

describe Alarm do
  it "is on when the pressure is too low  " do
    alarm = FakeAlarm.new(15)

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end

  it "is on when the pressure is too high  " do
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
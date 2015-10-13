require_relative '../lib/alarm'

describe Alarm do
  it "is on when the pressure is too low  " do
    alarm = FakeAlarm.new

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end
end

class FakeAlarm < Alarm

  def sample_pressure
    15
  end
end
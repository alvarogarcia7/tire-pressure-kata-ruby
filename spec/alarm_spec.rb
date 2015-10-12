require_relative '../lib/alarm'

describe Alarm do
  it "is on when pressure is too low" do
    alarm = FakeAlarm.new(15)

    alarm.check

    expect(alarm.alarm_on).to be_truthy
  end

  it "is off when pressure is in the safety range" do
    alarm = FakeAlarm.new(18)

    alarm.check

    expect(alarm.alarm_on).to be_falsey
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
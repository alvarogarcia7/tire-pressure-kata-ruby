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

  it "is off when the pressure is in the safety range" do
    alarm = FakeAlarm.new(18)

    alarm.check

    #Warning: see explanations#20
    expect(alarm.alarm_on).to be(false)
  end
end

class FakeAlarm < Alarm

  def initialize value
    super()
    @value = value
  end

  def sample_pressure
    @value
  end
end
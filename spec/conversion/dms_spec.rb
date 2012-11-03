# With negative numbers
# With nil
# With empty strings
# With strings
require 'spec_helper'

describe GeoPosition::Conversion::Dms do
  subject { described_class.new(12,3,42.42,'w') }

  it "responds to #to_f" do
    subject.should respond_to(:to_f)
  end

  it "responds to #to_s" do
    subject.should respond_to(:to_s)
  end

  it "raises an exception if invalid direction is given" do
    lambda { described_class.new(12,12,23,'r') }.should raise_error(GeoPosition::Conversion::Dms::InvalidDirectionError)
  end

  it "coerces the degrees to a float" do
    subject.degrees.should eql(12.0)
  end

  it "coerces the minutes to a float" do
    subject.minutes.should eql(3.0)
  end

  it "coerces the seconds to a float" do
    subject.seconds.should eql(42.42)
  end

  it "upcases the direction" do
    gp = described_class.new(12,12,12,'n')
    gp.direction.should == 'N'
  end

  it "returns the formatted string" do
    subject.to_s.should == "12 deg 3' 42.42\" W"
  end

  it "returns the floated conversion" do
    subject.to_f.should eql(-12.061783333333333)
  end

  context("North") do
    subject { described_class.new(12,3,42.42,'n') }

    it "returns the formatted string" do
      subject.to_s.should == "12 deg 3' 42.42\" N"
    end

    it "returns the floated conversion" do
      subject.to_f.should eql(12.061783333333333)
    end
  end

  context("East") do
    subject { described_class.new(12,3,42.42,'e') }

    it "returns the formatted string" do
      subject.to_s.should == "12 deg 3' 42.42\" E"
    end

    it "returns the floated conversion" do
      subject.to_f.should eql(12.061783333333333)
    end
  end

  context("South") do
    subject { described_class.new(12,3,42.42,'s') }

    it "returns the formatted string" do
      subject.to_s.should == "12 deg 3' 42.42\" S"
    end

    it "returns the floated conversion" do
      subject.to_f.should eql(-12.061783333333333)
    end
  end

  context("West") do
    subject { described_class.new(12,3,42.42,'w') }

    it "returns the formatted string" do
      subject.to_s.should == "12 deg 3' 42.42\" W"
    end

    it "returns the floated conversion" do
      subject.to_f.should eql(-12.061783333333333)
    end
  end
end

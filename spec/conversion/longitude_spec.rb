require 'spec_helper'

describe GeoPosition::Conversion::Longitude do
  let(:longitude) { '-157.441' }
  subject { described_class.new(longitude) }

  context('Error Handling') do
    it "raises an exception if longitude is greater than 180" do
      lambda { described_class.new(181) }.should raise_error(GeoPosition::Error::InvalidLongitudeError)
    end

    it "raises an exception if longitude is greater than -180" do
      lambda { described_class.new(-181) }.should raise_error(GeoPosition::Error::InvalidLongitudeError)
    end

    it "raises an exception if longitude cannot be coerced to a float" do
      lambda { described_class.new([12]) }.should raise_error(GeoPosition::Error::InvalidFloatError)
    end
  end

  it "responds to #to_s" do
    subject.should respond_to(:to_s)
  end

  it "returns 'W' for the direction" do
    subject.direction.should == 'W'
  end

  it "returns 'E' for the direction" do
    east = longitude.to_f * -1
    lc = described_class.new(east)
    lc.direction.should == 'E'
  end

  it "returns 157 degrees" do
    subject.degrees.should eql(157)
  end

  it "returns 26 minutes" do
    subject.minutes.should eql(26)
  end

  it "returns 27 seconds" do
    subject.seconds.should eql(27)
  end

  it "returns the DMS string" do
    subject.to_s.should == "157 deg 26' 27\" W"
  end
end

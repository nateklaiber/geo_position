require 'spec_helper'

describe GeoPosition::Conversion::Latitude do
  let(:latitude) { '70.4947' }
  subject { described_class.new(latitude) }

  context('Error Handling') do
    it "raises an exception if latitude is greater than 90" do
      lambda { described_class.new(91) }.should raise_error(GeoPosition::Error::InvalidLatitudeError)
    end

    it "raises an exception if latitude is greater than -90" do
      lambda { described_class.new(-91) }.should raise_error(GeoPosition::Error::InvalidLatitudeError)
    end

    it "raises an exception if latitude cannot be coerced to a float" do
      lambda { described_class.new([12]) }.should raise_error(GeoPosition::Error::InvalidFloatError)
    end
  end

  it "responds to #to_s" do
    subject.should respond_to(:to_s)
  end

  it "returns 'N' for the direction" do
    subject.direction.should == 'N'
  end

  it "returns 'S' for the direction" do
    south = latitude.to_f * -1
    lc = described_class.new(south)
    lc.direction.should == 'S'
  end

  it "returns 70 degrees" do
    subject.degrees.should eql(70)
  end

  it "returns 29 minutes" do
    subject.minutes.should eql(29)
  end

  it "returns 40 seconds" do
    subject.seconds.should eql(40)
  end

  it "returns the DMS string" do
    subject.to_s.should == "70 deg 29' 40\" N"
  end
end

require 'spec_helper'

describe GeoPosition::Parser::Dms do
  let(:dms_string) { "40 deg 20' 13.20\" N" }
  subject { described_class.new(dms_string) }

  context('Error Handling') do
    it "raises an exception if the string is not in an accepted format" do
      lambda { described_class.new('invalid format') }.should raise_error(GeoPosition::Error::InvalidDmsStringError)
    end
  end

  context("Simple format") do
    let(:simple_string) { "12 12 42.42 n" }
    subject { described_class.new(simple_string) }

    it "returns 12 degrees" do
      subject.degrees.should eql(12)
    end

    it "returns 12 minutes" do
      subject.minutes.should eql(12)
    end

    it "returns 42.42 seconds" do
      subject.seconds.should eql(42.42)
    end

    it "returns 'W' for the direction" do
      subject.direction.should == "N"
    end

    it "serializes to a hash" do
      expected = {
        :degrees   => 12,
        :minutes   => 12,
        :seconds   => 42.42,
        :direction => 'N'
      }
      subject.to_hash.should == expected
    end
  end

  context("With 'deg' in the name") do
    it "returns 40 degrees" do
      subject.degrees.should eql(40)
    end

    it "returns 20 minutes" do
      subject.minutes.should eql(20)
    end

    it "returns 13.20 seconds" do
      subject.seconds.should eql(13.20)
    end

    it "returns 'N' for the direction" do
      subject.direction.should  == "N"
    end

    it "serializes to a hash" do
      expected = {
        :degrees   => 40,
        :minutes   => 20,
        :seconds   => 13.20,
        :direction => 'N'
      }
      subject.to_hash.should == expected
    end
  end

  it "responds to #degrees" do
    subject.should respond_to(:degrees)
  end

  it "responds to #minutes" do
    subject.should respond_to(:minutes)
  end

  it "responds to #seconds" do
    subject.should respond_to(:seconds)
  end

  it "responds to #direction" do
    subject.should respond_to(:direction)
  end

  it "responds to #to_hash" do
    subject.should respond_to(:to_hash)
  end
end

require 'spec_helper'

describe Date do
  subject { Date.civil(2008,1,1) } # New Year's Day
  let(:new_years_day) { Date.civil(2010, 1, 1) }
  let(:observed_new_years) { Date.civil(2010, 12, 31) }
  let(:memorial_day) { Date.civil(2011, 5, 30) }
  let(:independence_day) { Date.civil(2011, 7, 4) }
  let(:observed_independence) { Date.civil(2009, 7, 3) }
  let(:labor_day) { Date.civil(2011, 9, 5) }
  let(:thanksgiving_day) { Date.civil(2011, 11, 24) }
  let(:black_friday) { Date.civil(2011, 11, 25) }
  let(:christmas_day) { Date.civil(2011, 12, 25) }
  let(:observed_christmas) { Date.civil(2011, 12, 26) }

  context "#holiday?" do
    it { should respond_to(:holiday?) }
    its(:holiday?) { should be_true }

    it "should return false on non-retail holidays" do
      Date.civil(2011,10,10).holiday?.should be_false
    end

    it "should recognize New Year's Day" do
      new_years_day.should be_holiday
    end

    it "should recognize observed New Year's Day" do
      observed_new_years.should be_holiday
    end

    it "should recognize Memorial Day" do
      memorial_day.should be_holiday
    end

    it "should recognize Independence Day" do
      independence_day.should be_holiday
    end

    it "should recognize observed Independence Day" do
      observed_independence.should be_holiday
    end

    it "should recognize Labor Day" do
      labor_day.should be_holiday
    end

    it "should recognize Thanksgiving Day" do
      thanksgiving_day.should be_holiday
    end

    it "should recognize Black Friday" do
      black_friday.should be_holiday
    end

    it "should recognize Christmas Day" do
      christmas_day.should be_holiday
    end

    it "should recognize observed Christmas Day" do
      observed_christmas.should be_holiday
    end

    it "should return false for non-holidays" do
      (new_years_day + 1).should_not be_holiday
      (new_years_day - 1).should_not be_holiday
      (observed_new_years - 1).should_not be_holiday
      (memorial_day - 1).should_not be_holiday
      (independence_day - 1).should_not be_holiday
    end
  end
end

describe DateTime do
  subject { DateTime.civil(2008,1,1) }

  context "#holiday?" do
    it { should respond_to(:holiday?) }
    its(:holiday?) { should be_true }

    it "should return false on non-retail holidays" do
      DateTime.civil(2011,10,10).should_not be_holiday
    end

    it "should return true on Thanksgiving" do
      DateTime.civil(2011, 11, 24).should be_holiday
    end

    it "should return true on Black Friday" do
      DateTime.civil(2011, 11, 25).should be_holiday
    end

    it "should return true on Labor Day" do
      DateTime.civil(2012, 9, 3).should be_holiday
    end

    it "should return true on Independenc Day" do
      DateTime.civil(2012, 7, 4).should be_holiday
    end

    it "should return true on Memorial Day" do
      DateTime.civil(2012, 5, 28).should be_holiday
    end
  end
end

describe Time do
  subject { Time.new(2008,1,1,15,35,0,6) }

  context "#holiday?" do
    it { should respond_to(:holiday?) }
    its(:holiday?) { should be_true }

    it "should return false on non-retail holidays" do
      Time.new(2011,10,10).should_not be_holiday
    end

    it "should return true on Thanksgiving" do
      Time.new(2011, 11, 24, 1, 35).should be_holiday
    end

    it "should return true on Black Friday" do
      Time.new(2011, 11, 25, 1, 35).should be_holiday
    end

    it "should return true on Labor Day" do
      Time.new(2012, 9, 3, 1, 35).should be_holiday
    end

    it "should return true on Independenc Day" do
      Time.new(2012, 7, 4, 1, 35).should be_holiday
    end

    it "should return true on Memorial Day" do
      Time.new(2012, 5, 28, 1, 35).should be_holiday
    end
  end
end

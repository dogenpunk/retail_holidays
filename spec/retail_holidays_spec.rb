require 'spec_helper'

describe RetailHolidays do
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

  context ".on" do
    it "should return the name of the holiday on a specified date" do
      RetailHolidays.on(new_years_day).should == "New Year's Day"
      RetailHolidays.on(observed_new_years).should == "New Year's Day (observed)"
      RetailHolidays.on(memorial_day).should == "Memorial Day"
      RetailHolidays.on(independence_day).should == "Independence Day"
      RetailHolidays.on(observed_independence).should == "Independence Day (observed)"
      RetailHolidays.on(labor_day).should == "Labor Day"
      RetailHolidays.on(thanksgiving_day).should == "Thanksgiving Day"
      RetailHolidays.on(black_friday).should == "Black Friday"
      RetailHolidays.on(christmas_day).should == "Christmas Day"
      RetailHolidays.on(observed_christmas).should == "Christmas Day (observed)"
    end
  end
end

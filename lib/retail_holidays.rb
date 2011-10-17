require 'date'
require 'retail_holidays/version'

module RetailHolidays

  def holiday?
    RetailHolidays.on(self)
  end

  def self.on(date)
    holidays = HolidayFactory.holidays
    observed = holidays.find do |_, holiday|
      holiday[1].observed_on? date
    end
    observed[1][1].to_s unless observed.nil?
  end

  private
  class Holiday
    def observed_on?(date)
      raise "Abstract Method Called: observed_on?"
    end
  end

  class NewYearsDay < Holiday
    def name
      "New Year's Day"
    end

    def to_s
      @observed ?
        name + " (observed)" :
        name
    end

    def observed_on?(date)
      month = date.month
      mday  = date.mday
      # TODO: move this to a generalized method
      if month == 1 && mday == 1
        @observed = false
        return true
      elsif month == 12 && mday == 31 && date.wday == 5
        return @observed = true
      elsif month == 1 && mday == 2 && date.wday == 1
        return @observed = true
      else
        return false
      end
    end
  end

  class MemorialDay < Holiday
    def name
      "Memorial Day"
    end

    def to_s
      name
    end

    def observed_on?(date)
      # TODO: move this to a generalized method
      target_day = 1
      target_month = 5
      target_year = date.year
      earliest_date = 1 + 7 * (4 - 1)
      weekday = Date.civil(target_year, target_month, earliest_date).wday
      offset = target_day == weekday ? 
        0 :
        target_day < weekday ? 
          target_day + (7 - weekday) :
          (target_day + (7 - weekday)) - 7
      observed = Date.civil(target_year, target_month, earliest_date + offset)
      observed.day < 24 ? observed += 7 : observed
      observed == date
    end
  end

  class IndependenceDay < Holiday
    def name
      "Independence Day"
    end

    def to_s
      @observed ?
        name + " (observed)" :
        name
    end

    def observed_on?(date)
      month = date.month
      mday  = date.mday
      if month == 7 && mday == 4
        @observed = false
        return true
      elsif month == 7 && mday == 3 && date.wday == 5
        return @observed = true
      elsif month == 7 && mday == 5 && date.wday == 1
        return @observed = true
      else
        return false
      end
    end
  end

  class LaborDay < Holiday
    def to_s
      "Labor Day"
    end

    def observed_on?(date)
      target_day = 1
      target_month = 9
      target_year = date.year
      earliest_date = 1 + 7 * (1 - 1)
      weekday = Date.civil(target_year, target_month, earliest_date).wday
      offset = target_day == weekday ?
        0 :
        target_day < weekday ?
          target_day + (7 - weekday) :
          (target_day + (7 - weekday)) - 7
      observed = Date.civil(target_year, target_month, earliest_date + offset)
      observed == date
    end
  end

  class ThanksgivingDay < Holiday
    def name
      "Thanksgiving Day"
    end

    def to_s
      name
    end

    def observed_on?(date)
      target_day = 4
      target_month = 11
      target_year = date.year
      earliest_date = 1 + 7 * (4 - 1)
      weekday = Date.civil(target_year, target_month, earliest_date).wday
      offset = target_day == weekday ?
        0 :
        target_day < weekday ?
          target_day + (7 - weekday) :
          (target_day + (7 - weekday)) - 7
      observed = Date.civil(target_year, target_month, earliest_date + offset)
      observed == date
    end
  end

  class BlackFriday < Holiday
    def name
      "Black Friday"
    end

    def to_s
      name
    end

    def observed_on?(date)
      target_day = 5
      target_month = 11
      target_year = date.year
      earliest_date = 1 + 7 * (4 - 1)
      weekday = Date.civil(target_year, target_month, earliest_date).wday
      offset = target_day == weekday ?
        0 :
        target_day < weekday ?
          target_day + (7 - weekday) :
          (target_day + (7 - weekday)) - 7
      observed = Date.civil(target_year, target_month, earliest_date + offset)
      observed == date
    end
  end

  class ChristmasDay < Holiday
    def name
      "Christmas Day"
    end

    def to_s
      @observed ?
        name + " (observed)" :
        name
    end

    def observed_on?(date)
      month = date.month
      mday  = date.mday
      if month == 12 && mday == 25
        @observed = false
        return true
      elsif month == 12 && mday == 24 && date.wday == 5
        return @observed = true
      elsif month == 12 && mday == 26 && date.wday == 1
        return @observed = true
      else
        return false
      end
    end
  end

  class HolidayFactory
    @@holidays = {
      :new_years_day      => [NewYearsDay, nil],
      :memorial_day       => [MemorialDay, nil],
      :independence_day   => [IndependenceDay, nil],
      :labor_day          => [LaborDay, nil],
      :thanksgiving_day   => [ThanksgivingDay, nil],
      :black_friday       => [BlackFriday, nil],
      :christmas_day      => [ChristmasDay, nil]
    }

    def self.holidays
      @@holidays.each do |_, value|
        value[1].nil? ?
          value[1] = value[0].new :
          value[1]
      end
      @@holidays
    end
  end
end

class Date
  include RetailHolidays
end

require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season] = {holiday_name => supply_array}
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []
  holiday_hash[:winter].each do |holiday, supplies|
    i = 0
    while i < supplies.length do
      winter_supplies.push(supplies[i])
      i += 1
    end
  end
  return winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  output = []
  holiday_hash.each do |season, holidays|
    season_name = season.to_s
    season_name.capitalize!
    output.push("#{season_name}:")
    holiday_hash[season].each do |holiday, supplies|
      holiday_name = holiday.to_s
      if holiday_name.include? ("_")
        holiday_name_split = holiday_name.split(/_/)
        i = 0
        while i < holiday_name_split.length do
          holiday_name_split[i].capitalize!
          i += 1
        end
        holiday_name = holiday_name_split.join(" ")
      else
        holiday_name.capitalize!
      end
      supplies_name = supplies.join(", ")
      output.push("  #{holiday_name}: #{supplies_name}")
    end
  end
  i = 0
  while i < output.length do
    puts output[i]
    i += 1
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_days = []
  holiday_hash.each do |season, holidays|
    holiday_hash[season].each do |holiday, supplies|
      if supplies.include? ("BBQ")
        bbq_days.push(holiday)
      end
    end
  end
  bbq_days
end


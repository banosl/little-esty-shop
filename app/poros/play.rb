require 'pry'
require "./app/services/nager_service.rb"
require "./app/poros/nager_public_holiday.rb"

# response = HTTParty.get("https://date.nager.at/api/v3/NextPublicHolidays/US")
# holidays = response.map do |holiday|
#   NagerPublicHoliday.new(holiday)
# end


@next_public_holidays = NagerService.new

binding.pry
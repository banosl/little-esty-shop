require 'httparty'

class NagerService
  def get_next_public_holidays
    response = HTTParty.get("https://date.nager.at/api/v3/NextPublicHolidays/US")
    holidays = response.map do |holiday|
      NagerPublicHoliday.new(holiday)
    end
  end
end
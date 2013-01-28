require 'csv'

def save_flight_details(flight_info)

  CSV.open("C:/screens/depart.csv", "a") do |csv|
    csv << flight_info
  end

end

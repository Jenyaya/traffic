require 'csv'

def save_flight_details(flight_info)

 # depart_time = CSV.parse(depart_time)

  CSV.open("depart.csv", "a") do |csv|
    csv << flight_info

  end


end

#save_flight_details([Time.now, 'asfas'])
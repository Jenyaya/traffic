When /^I open online schedule$/ do

  show_all_btn = find(:css, 'button.board-short__full-button')
  show_all_btn.click
end


When /^I open (Arrival|Departure) schedule$/ do |schedule|

   if /en/ =~ Regexp.escape(current_path)
    # for EN
    find(:xpath, "//div[contains(@class, 'board-sw__item')]/span[contains(text(),'#{schedule}')]").click
  else
    # for UA
    find(:xpath, "//div[contains(@data-bind, '#{schedule.downcase}')]/span").click
  end

end


Then /^I get (arrival|depart) time for "(.*?)" flight$/ do |time, flight|

  #save_flight_details('13:25')

  # # Flight status text
  #{find(:xpath, "//div[text()='#{flight}']/following-sibling::div[@class='flight__status']").text}"

  # Flight status
  # puts find(:xpath, "//div[text()='#{flight}']/following-sibling::div[4]").text

  # Ancestor
  # flight_info =  find(:xpath, "//div[text()='#{flight}']/parent::div[@class='flight'][1]").text

  flight_info = [Time.now.strftime('%F %R')]

  all(:xpath, "//div[text()='#{flight}']/parent::div[@class='flight'][1]/div").length.times { |i|

    flight_info << find(:xpath, "//div[text()='#{flight}']/parent::div[@class='flight'][1]/div[#{i+1}]").text

  }


  # Ancestor id
  #puts  find(:xpath, "//div[text()='#{flight}']/parent::div[@class='flight'][1]")["flight-id"]

  save_flight_details(flight_info)

end
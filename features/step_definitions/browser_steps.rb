Given /^opened "(.*?)" page$/ do |page|
  case page
    when 'Yandex Maps' then
      page = 'http://maps.yandex.ua/?ll=30.478959%2C50.442439&spn=0.494385%2C0.147551&z=12&l=map%2Ctrf%2Ctrfe%2Ccmr%2Cmap&trfm=cur'
  end
  visit page

end


Then /^I take screenshots$/ do

  screenshot_path = "screens/#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}.png"

  page.driver.browser.manage.window.maximize
  page.driver.browser.save_screenshot(screenshot_path)

end

When /^I close left frame$/ do
  find(:css, 'div.b-page__switcher_type_left').click
end


When /I run script "(.*?)" times/ do |time|

  time.to_i.times {

    step "opened \"Yandex Maps\" page"
    step "I close left frame"
    step "I take screenshots"

    page.driver.browser.quit

    sleep(60)
  }

end
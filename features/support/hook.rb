Before do |scenario|
  Capybara.current_driver = :selenium
end

After do |scenario|
  page.execute_script "window.close();"
end
Given("We navigate to the login page") do
 visit 'http://ec2-52-15-34-101.us-east-2.compute.amazonaws.com/users/sign_in'
end

When("We fill valid credentials") do
  find_by_id('user_email').send_keys('abhishek.kanojia+1@vinsol.com')
  find_by_id('user_password').send_keys('1111111')
  click_on('Log in')
end

Then("The dashboard will be displayed") do
  confirm = find('.positive')
  confirm.text.include?("Signed in successfully.")
end

When("We enter invalid email and correct password") do
  find_by_id('user_email').send_keys(' ')
  find_by_id('user_password').send_keys('1111111')
  click_on('Log in')
end

When("We enter correct email and invalid password") do
  find_by_id('user_email').send_keys('abhishek.kanojia+1@vinsol.com')
  find_by_id('user_password').send_keys('11111')
  click_on('Log in')
end

When("We enter incorrect email and password") do
  find_by_id('user_email').send_keys('abhishek.kanojia')
  find_by_id('user_password').send_keys('11111')
  click_on('Log in')
end

Then("We should see error") do
  confirm = find('.negative')
  confirm.text.include?("Invalid Email or password.")
end
require 'rails_helper'

feature 'Sign In' do

  let(:user){create(:user)}
  scenario 'User cant sign in if not correct credentials' do
    signin('invalidemail@example.com','invalispassword')

    expect(page).to have_content('Invalid Email')
  end

  scenario 'User cant sign in if not correct email' do
    signin('invalidemail@example.com',user.password)

    expect(page).to have_content('Invalid Email')
  end

  scenario 'User cant sign in if not correct password' do
    signin(user.email,'invalidpasssword')

    expect(page).to have_content('Invalid Email')
  end

  scenario 'User can sign in if correct credentials' do
    signin(user.email,user.password)

    expect(page).not_to have_content('Invalid Email')
  end
end
require 'spec_helper'

feature 'Visitor signs up' do
  let(:user) { create :user }

  scenario 'with valid email and password' do
    sign_up_with 'test@email.com', 'password'
    expect(page).to have_content('Logout')
    expect(page).to have_content('School Diary Application')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', user.password
    expect(page).to have_content('is invalid')
  end

  scenario 'with blank password' do
    sign_up_with user.email, ''
    expect(page).to have_content("can't be blank")
  end
end

require 'spec_helper'

feature 'User creates teacher' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit teachers_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Teacher'
    expect(page).to have_content 'Teacher has been created!'
  end

  scenario 'without first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Teacher'
    expect(page).to have_content "can't be blank"
  end

  scenario 'without last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Teacher'
    expect(page).to have_content "can't be blank"
  end
end

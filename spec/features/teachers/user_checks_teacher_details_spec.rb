require 'spec_helper'

feature 'User checks teacher details' do
  let!(:teacher) { create :teacher, first_name: 'Pies', last_name: 'Pluto', academic_title: 'Dr.' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit teachers_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Teachers » Dr. Pies Pluto'
    end
  end
end

require 'spec_helper'

feature 'User checks teacher subjects' do
  let!(:teacher) { create :teacher, first_name: 'Pies', last_name: 'Pluto', academic_title: 'Dr.' }
  let!(:subject_item) { create :subject_item, title: 'Boring subject item', teacher: teacher }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit teachers_path
    find(:xpath, "//a[@title='show subjects']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Teachers » Pies Pluto subjects'
    end

    expect(page).to have_content 'Boring subject item'
  end
end

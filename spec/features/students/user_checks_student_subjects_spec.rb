require 'spec_helper'

feature 'User checks student subjects' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:subject_item) { create :subject_item, title: 'Math' }
  let!(:participant) { create :participation, student: student, subject_item: subject_item }
  let!(:subject_item_note) { create :subject_item_note, subject_item: subject_item, student: student }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@title='show subjects']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Jan Nowak subjects'
    end

    expect(page).to have_content 'Math'
  end
end

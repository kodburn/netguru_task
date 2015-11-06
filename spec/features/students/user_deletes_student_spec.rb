require 'spec_helper'

feature 'User deletes student' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Abacki' }
  let!(:subject_item) { create :subject_item, title: 'Math' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
  end

  scenario do
    find(:xpath, "//a[@title='delete']").click
    expect(page).to have_content 'Student has been deleted!'
    expect(page).to have_no_content 'Jan'
  end

  context 'with assigned notes' do
    let!(:participant) { create :participation, student: student, subject_item: subject_item }
    let!(:subject_item_note) { create :subject_item_note, subject_item: subject_item, student: student }

    scenario do
      find(:xpath, "//a[@title='delete']").click
      expect(page).to have_content 'Student has been deleted!'
      expect(page).to have_no_content 'Jan'
    end
  end
end

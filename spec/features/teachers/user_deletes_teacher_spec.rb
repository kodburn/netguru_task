require 'spec_helper'

feature 'User deletes teacher' do
  let!(:teacher) { create :teacher, first_name: 'Pies', last_name: 'Pluto', academic_title: 'Dr.' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit teachers_path
  end

  scenario do
    find(:xpath, "//a[@title='delete']").click
    expect(page).to have_content 'Teacher has been deleted!'
    expect(page).to have_no_content 'Dr.'
  end

  context 'with assigned subject item' do
    let!(:subject_item) { create :subject_item, title: 'Boring subject item', teacher: teacher }

    scenario do
      find(:xpath, "//a[@title='delete']").click
      expect(page).to have_content 'Teacher has been deleted!'
      expect(page).to have_no_content 'Dr.'
    end
  end
end

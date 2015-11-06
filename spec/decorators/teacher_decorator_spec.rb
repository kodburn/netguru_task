require 'rails_helper'

describe TeacherDecorator do
  let(:teacher) { build :teacher, academic_title: 'Doctor', first_name: 'Lana', last_name: 'Del Rey' }

  describe "#full_name_with_title" do
    subject { teacher.decorate.full_name_with_title }
    it { is_expected.to eq 'Lana Del Rey [Doctor]' }
  end

  describe "#full_name" do
    subject { teacher.decorate.full_name }
    it { is_expected.to eq 'Lana Del Rey' }
  end
end

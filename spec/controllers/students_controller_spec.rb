require 'rails_helper'

RSpec.describe StudentsController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #show' do
    let(:student) { create :student }
    subject { get :show, id: student.id }

    it_behaves_like 'template rendering action', :show
  end

  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:student) { create :student }
    subject { get :edit, id: student.id }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'POST #create' do
    let!(:params) { { student: build(:student).attributes } }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to student_path(controller.student) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq I18n.t('shared.created', resource: 'Student')
      end

      it 'creates student' do
        expect{ subject }.to change(Student, :count).by(1)
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :new
    end
  end

  describe 'PUT #update' do
    let!(:student) { create :student, first_name: 'John', last_name: 'Smith' }
    let(:first_name) { 'Walter' }
    let(:last_name) { 'White' }
    let!(:params) do
      { id: student.id, student: { first_name: first_name } }
    end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to student_path(controller.student) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq I18n.t('shared.updated', resource: 'Student')
      end

      context 'updates student' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ student.reload.first_name }.to(first_name) }
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :edit
    end
  end

  describe 'DELETE #destroy' do
    let!(:student) { create :student }
    subject { delete :destroy, id: student.id }

    it { is_expected.to redirect_to students_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq I18n.t('shared.deleted', resource: 'Student')
    end

    it 'destroys student' do
      expect{ subject }.to change(Student, :count).by(-1)
    end
  end
end

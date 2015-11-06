require 'rails_helper'

RSpec.describe TeachersController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #show' do
    let(:teacher) { create :teacher }
    subject { get :show, id: teacher.id }

    it_behaves_like 'template rendering action', :show
  end

  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:teacher) { create :teacher }
    subject { get :edit, id: teacher.id }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'POST #create' do
    let!(:params) { { teacher: build(:teacher).attributes } }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to teacher_path(controller.teacher) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq I18n.t('shared.created', resource: 'Teacher')
      end

      it 'creates teacher' do
        expect{ subject }.to change(Teacher, :count).by(1)
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :new
    end
  end

  describe 'PUT #update' do
    let!(:teacher) { create :teacher, first_name: 'John', last_name: 'Smith', academic_title: 'TA' }
    let(:first_name) { 'Walter' }
    let!(:params) do
      { id: teacher.id, teacher: { first_name: first_name } }
    end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to teacher_path(controller.teacher) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq I18n.t('shared.updated', resource: 'Teacher')
      end

      context 'updates teacher' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ teacher.reload.first_name }.to(first_name) }
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :edit
    end
  end

  describe 'DELETE #destroy' do
    let!(:teacher) { create :teacher }
    subject { delete :destroy, id: teacher.id }

    it { is_expected.to redirect_to teachers_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq I18n.t('shared.deleted', resource: 'Teacher')
    end

    it 'destroys teacher' do
      expect{ subject }.to change(Teacher, :count).by(-1)
    end
  end
end

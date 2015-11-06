require 'rails_helper'

RSpec.describe VisitorsController do
  let(:user) { create :user }

  before { sign_in user }

  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end
end

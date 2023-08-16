require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { create(:user) }
  before(:example) do
    sign_in user
  end

  describe 'GET /groups' do
    it 'renders the index template' do
      sign_in user
      get groups_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get groups_url
      expect(response).to render_template('groups/index')
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_url(1)
      expect(response).to be_successful
    end
  end

end

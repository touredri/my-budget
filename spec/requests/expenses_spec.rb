# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  before(:example) do
    sign_in user
  end

  describe 'GET /expenses/new' do
    it 'redirects to login page if user is not logged in' do
      sign_out user
      get new_expense_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET /expenses/new' do
    it 'renders the new template' do
      group = create(:group)
      get new_expense_path(group_id: group.id)
      expect(response).to render_template(:new)
    end

    it 'displays the expense form' do
      group = create(:group, user_id: user.id)
      get new_expense_path(group_id: group.id)
      expect(response).to render_template(:new)
    end
  end
end

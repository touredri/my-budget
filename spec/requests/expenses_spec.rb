require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  before(:example) do
    sign_in user
  end

  describe 'GET /expenses/new' do
    it 'renders the new template' do
      get new_expense_path(group_id: group.id)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /expenses' do
    it 'creates a new expense' do
      sign_in user
      expect {
        post expenses_path, params: { expense: { name: 'Cake', amount: 10, group_id: group.id } }
      }.to change(Expense, :count).by(1)
      expect(response).to redirect_to(group_path(group))
    end
  end

  describe 'GET /expenses/:id' do
    it 'renders the show template' do
      sign_in user
      get expense_path(expense)
      expect(response).to render_template(:show)
    end
  end

  describe 'PATCH /expenses/:id' do
    it 'updates the expense' do
      sign_in user
      new_name = 'New Name'
      patch expense_path(expense), params: { expense: { name: new_name } }
      expense.reload
      expect(expense.name).to eq(new_name)
      expect(response).to redirect_to(expense_path(expense))
    end
  end
end

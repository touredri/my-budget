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
      group = create(:group)
      get new_expense_path(group_id: group.id)
      expect(response.body).to have_selector('form')
      expect(response.body).to have_selector('input[type="text"][name="expense[name]"]')
      expect(response.body).to have_selector('input[type="number"][name="expense[amount]"]')
      expect(response.body).to have_selector('input[type="hidden"][name="expense[group_id]"]')
      expect(response.body).to have_selector('input[type="submit"]')
    end

    it 'creates a new expense' do
      group = create(:group)
      visit new_expense_path(group_id: group.id)
      fill_in 'expense[name]', with: 'Cake'
      fill_in 'expense[amount]', with: 10.0
      click_button 'Create Expense'

      expect(response).to redirect_to(group_path(group))
      expect(Expense.last.name).to eq('Cake')
      expect(Expense.last.amount).to eq(10.0)
      expect(Expense.last.group).to eq(group)
    end

    it 'displays errors if expense creation fails' do
      group = create(:group)
      visit new_expense_path(group_id: group.id)
      click_button 'Create Expense'

      expect(response).to render_template(:new)
      expect(response.body).to have_selector('div[style="color: gray;"]')
    end
  end
end

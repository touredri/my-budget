# frozen_string_literal: true

# spec/features/expenses_spec.rb

require 'rails_helper'

RSpec.describe 'Expenses', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    sign_in(user)
    visit new_expense_path(group_id: group.id)
    fill_in 'Name', with: 'Test Expense'
    fill_in 'Amount', with: '10'
    click_button 'Create Expense'
  end

  it 'should have the name' do
    expect(page).to have_current_path(group_path(group))
    expect(page).to have_content('Test Expense')
  end

  it 'should have the amount' do
    expect(page).to have_current_path(group_path(group))
    expect(page).to have_content('10')
  end

  it 'should remove the expense' do
    find(:css, 'p', text: 'Test Expense').click
    click_button 'remove'
    expect(page).to have_current_path(group_path(group))
    expect(page).to have_no_content('Test Expense')
    expect(page).to have_no_content('10')
  end
end

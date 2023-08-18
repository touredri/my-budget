# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    group = create(:group)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = FactoryBot.build(:group, name: nil)
    expect(group).to_not be_valid
  end

  it 'can calculate total expenses' do
    user = create(:user)
    group = create(:group, user:)
    ex1 = create(:expense, amount: 50, author: user)
    ex2 = create(:expense, amount: 100, author: user)
    group.expenses << ex1
    group.expenses << ex2
    expect(group.total_expense).to eq(150)
  end
end

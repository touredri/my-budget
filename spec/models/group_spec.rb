require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    group = create(:group, :with_icon)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = FactoryBot.build(:group, name: nil)
    expect(group).to_not be_valid
  end

  it 'is not valid without an icon' do
    group = FactoryBot.build(:group, icon: nil)
    expect(group).to_not be_valid
  end

  it 'can calculate total expenses' do
    group = create(:group)
    ex1 = create(:expense, amount: 50)
    ex2 = create(:expense, amount: 100)
    group.expenses = [ex1, ex2]
    expect(group.total_expense).to eq(150)
  end
end

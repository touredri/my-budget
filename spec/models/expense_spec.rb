# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { create(:user) }
  subject { create(:expense, author_id: user.id) }
  before { subject.save }

  it 'Expense does not have errors if name and amount is present' do
    expect(subject).to be_valid
  end

  it 'Name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name should be at least 3 chars long' do
    subject.name = 'ab'
    expect(subject).to_not be_valid
  end

  it 'Amount is not nil' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Amount is > 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'Has a user' do
    expect(subject.author).to eql(user)
  end
end

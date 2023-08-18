# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :expense do
    association :author, factory: :user
    name { Faker::Lorem.words(number: 3).join(' ') }
    amount { Faker::Number.decimal(l_digits: 2) }
    author_id { 1 }

    transient do
      group { nil }
    end

    after(:create) do |expense, evaluator|
      evaluator.group.expenses << expense if evaluator.group
    end
  end
end

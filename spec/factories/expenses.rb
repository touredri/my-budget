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
      if evaluator.group
        evaluator.group.expenses << expense
      end
    end
  end
end

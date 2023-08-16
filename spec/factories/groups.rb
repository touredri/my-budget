# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :group do
    association :user, factory: :user
    name { Faker::Lorem.words(number: 2).join(' ') }
    # Use a callback to attach an icon to the group
    trait :with_icon do
      before(:create) do |group|
        icon_path = Rails.root.join('spec', 'resources', 'hamburger.png')
        group.icon.attach(io: File.open(icon_path), filename: 'hamburger.png', content_type: 'image/png')
      end
    end
  end
end

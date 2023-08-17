# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :group do
    association :user, factory: :user
    name { Faker::Lorem.words(number: 2).join(' ') }

    # Use a callback to attach an icon to the group
    after(:build) do |group|
      icon_path = Rails.root.join('spec', 'resources', 'naruto.jpg')
      group.icon.attach(io: File.open(icon_path), filename: 'naruto.jpg')
    end
  end
end

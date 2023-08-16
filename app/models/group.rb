# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses
  has_one_attached :icon

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :icon, presence: true

  def total_expense
    expenses.sum(:amount) || 0
  end
end

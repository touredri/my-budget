class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :amount, numericality: { greater_than: 0 }
end

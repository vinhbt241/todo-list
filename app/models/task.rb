# frozen_string_literal: true

class Task < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  # attributes
  enum priority: { low: 0, medium: 1, high: 2 }
  enum status: { pending: 0, completed: 1 }
end

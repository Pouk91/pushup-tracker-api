# frozen_string_literal: true
class Workout < ApplicationRecord
  belongs_to :user
  validates :name, :reps, :sets, presence: true
end

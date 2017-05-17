# frozen_string_literal: true
class Workout < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
end

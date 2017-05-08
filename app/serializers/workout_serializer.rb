class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :reps, :sets
end

class EventType < ApplicationRecord
  validates_uniqueness_of :name
end

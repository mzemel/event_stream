# Basic data model which represents the type of GitHub event
class EventType < ApplicationRecord
  validates_uniqueness_of :name
end

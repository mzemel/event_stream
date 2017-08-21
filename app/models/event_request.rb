class EventRequest < ApplicationRecord
  validates_uniqueness_of :owner_id, scope: [:repo_id, :event_type_id]
end

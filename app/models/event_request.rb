# Persistent service object that represents a request to GitHub's API
class EventRequest < ApplicationRecord
  validates_uniqueness_of :owner_id, scope: %i[repo_id event_type_id]
end

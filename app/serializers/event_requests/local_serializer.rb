module EventRequests
  # Serializes an EventRequest record using only local data
  class LocalSerializer < ActiveModel::Serializer
    attributes :owner_id, :repo_id, :event_type_id
  end
end

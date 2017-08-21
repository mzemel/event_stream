module EventRequests
  # Retrieves and serializes event data from the GitHub API
  class DetailedSerializer < ActiveModel::Serializer
    attributes :owner_id, :repo_id, :event_type_id, :events

    def events
      event_request_retriever.call.map { |event| format_event(event) }
    end

    private

    def event_request_retriever
      @event_request_retriever ||= EventRequestRetriever.new(event_request_id: object.id)
    end

    def format_event(event)
      data = event.slice('actor', 'created_at')
      data.merge('event_type' => event['type'])
    end
  end
end

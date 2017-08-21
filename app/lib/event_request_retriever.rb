# Service object to take an EventRequest record and perform the network request
class EventRequestRetriever
  include HTTParty
  base_uri 'api.github.com'

  delegate :owner, :repo, :event_type, to: :event_request

  # Does another lookup of the record to prevent n+3 query
  def initialize(event_request_id:)
    @event_request = EventRequest.includes(:owner, :repo, :event_type).find(event_request_id)
  end

  def call
    event_data.select { |el| el['type'] == event_type.name }
  end

  private

  attr_reader :event_request

  def resource_path
    "/repos/#{owner.name}/#{repo.name}/events"
  end

  def event_data
    self.class.get(resource_path)
  end
end

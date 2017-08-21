# Creates and shows EventRequest records
class EventRequestsController < ApplicationController
  respond_to :json

  def create
    event_request = event_request_creator.call
    respond_with event_request, serializer: EventRequests::LocalSerializer
  end

  private

  def event_request_creator
    @event_request_creator ||= EventRequestCreator.new(
      params.permit(:owner_name, :repo_name, :event_type_name)
    )
  end
end

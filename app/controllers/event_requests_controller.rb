# Creates and shows EventRequest records
class EventRequestsController < ApplicationController
  respond_to :json

  def index
    respond_with EventRequest.all, each_serializer: EventRequests::LocalSerializer
  end

  def show
    respond_with EventRequest.find(params[:id]), serializer: EventRequests::DetailedSerializer
  end

  def create
    if event_request.errors.any?
      respond_with event_request, serializer: EventRequests::LocalSerializer
    else
      respond_with event_request, serializer: EventRequests::DetailedSerializer
    end
  end

  private

  def event_request
    @event_request ||= event_request_creator.call
  end

  def event_request_creator
    @event_request_creator ||= EventRequestCreator.new(
      params.permit(:owner_name, :repo_name, :event_type_name)
    )
  end
end

# Creates and shows EventRequest records
class EventRequestsController < ApplicationController
  def create
    EventRequest.find_or_create_by(owner: owner, repo: repo, event_type: event_type)
  end

  private

  def owner
    @owner ||= Owner.find_or_create_by(name: params[:owner_name])
  end

  def repo
    @repo ||= Repo.find_or_create_by(name: params[:repo_name])
  end

  def event_type
    @event_type ||= EventType.find_or_create_by(name: params[:event_type_name])
  end
end

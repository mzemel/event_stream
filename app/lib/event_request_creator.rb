# Performs custom validation of an EventRequest's associations
class EventRequestCreator
  def initialize(params)
    @params = params
    @errors = ActiveModel::Errors.new(self)
  end

  def call
    return event_request if event_request.persisted?
    validate_event_request
  end

  private

  attr_reader :params

  def event_request
    @event_request ||= EventRequest.find_or_initialize_by(
      owner: owner,
      repo: repo,
      event_type: event_type
    )
  end

  def validate_event_request
    errors = event_request.errors
    errors.add(:owner, 'is invalid') unless owner.valid?
    errors.add(:repo, 'is invalid') unless repo.valid?
    event_request.save if errors.blank?
    event_request
  end

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

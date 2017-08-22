owner = Owner.create(name: 'rails')
repo = Repo.create(name: 'rails')
event_type = EventType.create(name: 'IssueCommentEvent')

EventRequest.create(owner: owner, repo: repo, event_type: event_type)
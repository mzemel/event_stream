require 'rails_helper'

RSpec.describe EventRequestRetriever do
  let(:owner) { create(:owner, name: 'rails') }
  let(:repo) { create(:repo, name: 'rails') }
  let(:event_type) { create(:event_type, name: 'IssueCommentEvent') }
  let(:event_request) { create(:event_request, owner: owner, repo: repo, event_type: event_type) }

  subject { EventRequestRetriever.new(event_request_id: event_request.id) }


  it 'returns a list of events with a given event_type' do
    VCR.use_cassette('events') do
      events = subject.call
      events.each do |event|
        expect(event['type']).to eq event_type.name
      end
    end
  end
end
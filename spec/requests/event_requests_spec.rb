require 'rails_helper'

RSpec.describe 'EventRequests', type: :request do
  describe 'POST #create' do
    subject do
      VCR.use_cassette('events') do
        post '/event_requests.json', params: event_request_params
      end
    end

    let(:owner_name) { 'rails' }
    let(:repo_name) { 'rails' }
    let(:event_type_name) { 'IssueCommentEvent' }

    let(:event_request_params) do
      {
        owner_name: owner_name,
        repo_name: repo_name,
        event_type_name: event_type_name
      }
    end

    describe 'database transactions' do
      it 'creates an EventRequest record' do
        expect {subject}.to change {EventRequest.count}.from(0).to(1)
      end

      it 'creates an Owner record' do
        expect {subject}.to change {Owner.count}.from(0).to(1)
      end

      it 'creates a Repo record' do
        expect {subject}.to change {Repo.count}.from(0).to(1)
      end

      it 'creates an EventType record' do
        expect {subject}.to change {EventType.count}.from(0).to(1)
      end

      context 'with existing data' do
        before do
          create(:owner, name: owner_name)
          create(:repo, name: repo_name)
          create(:event_type, name: event_type_name)
        end

        it 'does not create an Owner record' do
          expect {subject}.to_not change {Owner.count}
        end

        it 'does not create a Repo record' do
          expect {subject}.to_not change {Repo.count}
        end

        it 'does not create an EventType record' do
          expect {subject}.to_not change {EventType.count}
        end
      end
    end

    describe 'api response' do
      before { subject }

      let(:parsed_response) { JSON.parse(response.body) }

      context 'with valid params' do
        it 'returns an http status of 201' do
          expect(response).to have_http_status(201)
        end

        it 'matches a JSON schema file' do
          expect(response).to match_response_schema('event_requests/detailed')
        end
      end

      context 'with invalid params' do
        let(:owner_name) { 'Michael Zemel' }

        it 'returns an http status of 422' do
          expect(response).to have_http_status(422)
        end

        it 'returns errors' do
          expect(parsed_response['errors']['owner']).to include 'is invalid'
        end
      end
    end
  end

  describe 'GET #index' do
    subject do
      get '/event_requests.json'
    end

    before do
      create_list(:event_request, 2)
      subject
    end

    it 'returns a collection of EventRequests with local data' do
      expect(response).to match_response_schema('event_requests/locals')
    end
  end

  describe 'GET #show' do
    let(:owner) { create(:owner, name: 'rails') }
    let(:repo) { create(:repo, name: 'rails') }
    let(:event_type) { create(:event_type, name: 'IssueCommentEvent') }
    let(:event_request) { create(:event_request, owner: owner, repo: repo, event_type: event_type) }

    subject do
      VCR.use_cassette('events') do
        get "/event_requests/#{event_request.id}.json"
      end
    end

    before { subject }

    it 'returns a detailed view of an EventRequest' do
      expect(response).to match_response_schema('event_requests/detailed')
    end
  end
end
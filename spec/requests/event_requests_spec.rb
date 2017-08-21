require 'rails_helper'

RSpec.describe 'EventRequests', type: :request do
  describe 'POST #create' do
    subject { post '/event_requests', params: event_request_params }

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
      context 'with valid params' do
        it 'returns an http status of 204' do
          expect(response).to have_http_status(204)
        end

        xit 'matches a JSON schema file' do
          expect(response).to match_response_schema('event_request')
        end
      end

      context 'with invalid params' do
        let(:owner_name) { 'Michael Zemel' }

        it 'returns an http status of 422' do
        end
      end
    end
  end
end
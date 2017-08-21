require 'rails_helper'

RSpec.describe EventRequestCreator do
  let(:owner_name) { 'rails' }
  let(:repo_name) { 'rails' }
  let(:event_type_name) { 'rails' }
  let(:params) do
    {
      owner_name: owner_name,
      repo_name: repo_name,
      event_type_name: event_type_name
    }
  end

  subject { EventRequestCreator.new(params).call }

  context 'when EventRequest already exists' do
    let(:owner) { create(:owner, name: owner_name) }
    let(:repo) { create(:repo, name: repo_name) }
    let(:event_type) { create(:event_type, name: event_type_name) }

    let(:event_request) do
      create(:event_request, owner: owner, repo: repo, event_type: event_type)
    end

    before { event_request.touch }

    it 'returns the EventRequest record' do
      expect(subject).to eq event_request
    end
  end

  context 'when EventRequest does not exist' do
    context 'when params are invalid' do
      let(:owner_name) { 'Michael Zemel' }

      it 'returns an invalid EventRequest' do
        expect(subject).to_not be_valid
      end

      it 'stores validation messages' do
        expect(subject.errors.full_messages).to include('Owner is invalid')
      end
    end

    context 'when params are valid' do
      it 'creates an EventRequest record' do
        expect(subject).to be_valid
      end
    end
  end
end
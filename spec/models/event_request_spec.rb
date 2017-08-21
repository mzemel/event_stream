require 'rails_helper'

RSpec.describe EventRequest, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:owner_id).scoped_to(:repo_id, :event_type_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:owner) }
    it { is_expected.to belong_to(:repo) }
    it { is_expected.to belong_to(:event_type) }
  end
end

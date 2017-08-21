require 'rails_helper'

RSpec.describe EventType, type: :model do
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end

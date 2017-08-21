require 'rails_helper'

RSpec.describe Owner, type: :model do
  subject { create(:owner) }

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:repos) }
  end
end

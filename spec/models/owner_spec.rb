require 'rails_helper'

RSpec.describe Owner, type: :model do
  subject { create(:owner) }

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }

    context 'when name is invalid' do
      before { subject.name = 'Michael Zemel' }

      it { is_expected.to_not be_valid }
    end
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:repos) }
  end
end

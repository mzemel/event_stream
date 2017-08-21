require 'rails_helper'

RSpec.describe Repo, type: :model do
  subject { create(:repo) }

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:owners) }
  end
end

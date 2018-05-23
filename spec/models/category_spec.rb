require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  describe 'relationships' do
    it { should have_many(:ideas) }
    it { should belong_to(:user) }
  end
end

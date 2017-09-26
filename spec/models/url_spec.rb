require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'Validations' do
    it 'has a valid factory' do
      expect(build(:url)).to be_valid
    end
  end
end

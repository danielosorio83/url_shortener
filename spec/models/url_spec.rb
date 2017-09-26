require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'Validations' do
    it 'has a valid factory' do
      expect(build(:url)).to be_valid
    end

    it { is_expected.to validate_uniqueness_of(:original_url) }
    it { is_expected.to validate_presence_of(:original_url) }

    context 'when `original_url` is invalid' do
      it 'should be invalid' do
        url = build(:url, original_url: 'malformatted_url')
        expect(url).not_to be_valid
      end

      it 'includes error for invalid url' do
        url = build(:url, original_url: 'malformatted_url')
        url.valid?
        expect(url.errors.full_messages.to_sentence).to match('is not a valid url')
      end
    end

    context 'when `original_url` is valid' do
      it 'should be valid' do
        url = build(:url)
        expect(url).to be_valid
      end
    end
  end
end

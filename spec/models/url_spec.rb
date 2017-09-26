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

  describe 'Callbacks' do
    it { is_expected.to callback(:sanitize_url).before(:create) }
  end

  describe 'Class Methods' do
    describe '.search' do
      context 'when `original_url` already exists' do
        let(:params) { { original_url: original_url } }

        context 'and original_url is already sanitized' do
          let(:original_url) { 'http://google.com' }

          it 'returns the existing url object' do
            url = create(:url, params)
            expect(Url.search(params)).to eq(url)
          end

          it 'does NOT creates the object' do
            url = create(:url, params)
            expect{
              Url.search(params)
            }.to change(Url, :count).by(0)
          end
        end

        context 'and original_url is NOT sanitized' do
          let(:original_url) { 'http://www.google.com' }

          it 'returns the existing url object' do
            url = create(:url, params)
            expect(Url.search(params)).to eq(url)
          end

          it 'does NOT creates the object' do
            url = create(:url, params)
            expect{
              Url.search(params)
            }.to change(Url, :count).by(0)
          end
        end
      end

      context 'when `original_url` don\'t exist in the database' do
        it 'creates the object' do
          expect{
            Url.search({ original_url: 'http://facebook.com' })
          }.to change(Url, :count).by(1)
        end
      end
    end
  end

  describe 'Private Instance Methods' do
    describe '#sanitize_url' do
      it 'returns nil when original_url is empty' do
        url = build(:url, original_url: nil)
        expect(url.send(:sanitize_url)).to be_nil
      end

      it 'returns other than nil when original_url is NOT empty' do
        url = build(:url)
        expect(url.send(:sanitize_url)).not_to be_nil
      end

      it 'adds the `http://` to original_url when missed' do
        url = build(:url, original_url: 'google.com')
        url.send(:sanitize_url)
        expect(url.original_url).to eq('http://google.com')
      end

      it 'removes the `www.` from original_url' do
        url = build(:url, original_url: 'www.google.com')
        url.send(:sanitize_url)
        expect(url.original_url).to eq('http://google.com')
      end

      it 'replaces the `https` for `http` from original_url' do
        url = build(:url, original_url: 'https://google.com')
        url.send(:sanitize_url)
        expect(url.original_url).to eq('http://google.com')
      end
    end
  end
end

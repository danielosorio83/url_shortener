require 'rails_helper'

RSpec.describe CodeStorage, type: :model do
  describe 'Validations' do
    it 'has a valid factory' do
      expect(build(:code_storage)).to be_valid
    end
  end

  describe 'Callbacks' do
    it { is_expected.to callback(:update_code).before(:validation).on(:create) }
    it { is_expected.to callback(:update_code).before(:validation).on(:update) }
  end

  describe 'Class Methods' do
    describe '.next_code' do
      it 'returns not nil' do
        expect(CodeStorage.next_code).not_to be_nil
      end

      it 'returns the first CodeStorage object code' do
        next_code = CodeStorage.next_code
        storage = CodeStorage.first
        expect(next_code).to eq(storage.code)
      end
    end
  end

  describe 'Private Instance Methods' do
    let(:code_storage) { build(:code_storage, code: nil) }

    describe '#update_code' do
      it 'calls `random_code`' do
        expect(code_storage).to receive(:random_code)
        code_storage.send(:update_code)
      end

      it 'sets `code`' do
        expect(code_storage.code).to be_nil
        code_storage.send(:update_code)
        expect(code_storage.code).not_to be_nil
      end
    end

    describe '#random_code' do
      it 'returns part of a Base64.urlsafe_encode64 of the current time' do
        now = Time.now
        allow(Time).to receive(:now).and_return(now)
        base64_code = Base64.urlsafe_encode64(now.to_i.to_s)[7...-2]
        expect(code_storage.send(:random_code)).to eq(base64_code)
      end
    end
  end
end

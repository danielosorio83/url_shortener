require 'rails_helper'

RSpec.describe UrlsHelper, type: :helper do
  describe '#alert_class(url)' do
    let(:url) { build(:url) }
    context 'when `url` have errors' do
      before do
        allow(url.errors).to receive(:any?).and_return(true)
      end
      it 'returns `danger`' do
        expect(helper.alert_class(url)).to eq('danger')
      end
    end

    context 'when `url` don\'t have errors' do
      before do
        allow(url.errors).to receive(:any?).and_return(false)
      end
      it 'returns `success`' do
        expect(helper.alert_class(url)).to eq('success')
      end
    end
  end
end

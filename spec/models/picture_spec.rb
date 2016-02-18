require 'rails_helper'

describe Picture do
  let(:picture) { build :picture }

  it 'has a valid factory' do
    expect(picture).to be_valid
  end

  describe '#url' do
    subject { picture.url }
    before { allow(picture).to receive(:image).and_return(image) }

    context 'when image is not nil' do
      let(:image) { double url: 'path/to/image' }
      it { is_expected.to eq 'path/to/image' }
    end

    context 'when image is nil' do
      let(:image) { nil }
      it { is_expected.to be_nil }
    end
  end
end

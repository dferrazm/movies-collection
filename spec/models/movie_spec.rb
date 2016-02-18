require 'rails_helper'

describe Movie do
  it 'has a valid factory' do
    expect(build :movie).to be_valid
  end

  describe 'validations' do
    it 'is invalid without a name' do
      expect(build :movie, name: nil).to be_invalid
      expect(build :movie, name: '').to be_invalid
    end

    it 'is invalid without an user owning it' do
      expect(build :movie, user: nil).to be_invalid
    end

    it 'is invalid with an invalid year' do
      expect(build :movie, year: -1).to be_invalid
      expect(build :movie, year: 0).to be_invalid
      expect(build :movie, year: 1.3).to be_invalid
    end
  end

  describe 'pictures' do
    let(:movie) { build_stubbed :movie }

    describe '#main_picture' do
      let(:first_pic) { instance_double(Picture) }
      let(:second_pic) { instance_double(Picture) }
      before { allow(movie).to receive(:pictures).and_return([first_pic, second_pic]) }

      subject { movie.main_picture }

      it { is_expected.to eq first_pic }
    end

    describe '#main_picture_url' do
      subject { movie.main_picture_url }
      before { allow(movie).to receive(:main_picture).and_return(main_picture) }

      context 'when it has a main picture' do
        let(:main_picture) { instance_double(Picture, url: 'path/to/picture') }
        it { is_expected.to eq 'path/to/picture' }
      end

      context 'when main picture is nil' do
        let(:main_picture) { nil }
        it { is_expected.to be_nil }
      end
    end

    describe '#add_picture' do
      it 'creates a new picture for the movie' do
        expect { movie.add_picture(image: sample_file) }.to change(movie.pictures, :count).by(1)
      end
    end

    describe '#remove_picture' do
      let(:picture) { create :picture, movie: movie }
      before { picture }

      it 'destroys the picture for the movie' do
        expect { movie.remove_picture(picture.id) }.to change(movie.pictures, :count).by(-1)
      end
    end
  end
end

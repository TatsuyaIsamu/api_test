RSpec.describe Idea, type: :model do
  describe 'idea モデル' do
    context 'インスタンスを作成しようとしたとき' do
      it 'インスタンスが作成出来る' do
        expect(create(:idea)).to be_valid
      end
    end
    context 'bodyがnull のインスタンスを作成しようとしたとき' do
      it 'インスタンスが作成できない' do
        expect { create(:idea, body: nil) }.to raise_error
      end
    end
  end
end

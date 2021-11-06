RSpec.describe Category, type: :model do
  describe 'category モデル' do
    context 'インスタンスを作成したとき' do
      it 'インスタンスが作成できる' do
        expect(create(:category)).to be_valid
      end
    end
    context 'name が null のインスタンスを作成しようとしたとき' do
      it 'インスタンスが作成できない' do
        expect { create(:category, name: nil) }.to raise_error
      end
    end
    context 'name が重複するインスタンスを作成したとき' do
      it 'インスタンスが作成できない' do
        create(:category)
        expect { create(:category) }.to raise_error
      end
    end
  end
end

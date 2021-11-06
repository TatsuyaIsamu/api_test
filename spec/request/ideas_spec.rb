describe 'アイデア登録API' do
  context 'カテゴリ名が存在しないアイデアを登録しようとしたとき' do
    it 'カテゴリとアイデアが登録される' do
      
    end
  end
  context 'カテゴリ名が存在するアイデアを登録しようとしたとき' do
    it '既存のカテゴリ名にアイデアが登録される' do
      
    end
  end

  context 'カテゴリ名が空のアイデアを登録しようとしたとき' do
    it '登録できない' do
      
    end
  end
  context 'アイデア名が空のアイデアを登録しようとしたとき' do
    it '登録できない' do
      
    end
  end
end

describe 'アイデア所得API' do
  context 'カテゴリ名をリクエストにつけとおくったとき' do
    it 'カテゴリ名にひもづくアイデアが所得できる' do

    end
  end
  context 'カテゴリ名を指定しなかったとき' do
    it '全てのアイデアが所得出来る' do
      
    end
  end
  context 'カテゴリ名が存在しなかったとき' do
    it 'ステータスコード404 が返る' do
      
    end
  end
end

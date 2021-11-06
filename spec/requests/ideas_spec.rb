describe 'アイデア登録API' do
  context 'カテゴリ名が存在しないアイデアを登録しようとしたとき' do
    it 'カテゴリとアイデアが登録される' do
        valid_params = { category_name: 'title', body: "body" }
        expect { post '/api/ideas', params: valid_params }.to change{Category.count}.by(+1).and change{Idea.count}.by(+1)
        expect(response.status).to eq(201)
    end
  end
  context 'カテゴリ名が存在するアイデアを登録しようとしたとき' do
    it '既存のカテゴリ名にアイデアが登録される' do
      create(:category, name: "test")
      valid_params = { category_name: 'test', body: "body" }
      expect { post '/api/ideas', params: valid_params }.to change{Category.count}.by(0).and change{Idea.count}.by(+1)
      expect(response.status).to eq(201)
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
      # FactoryBot.create_list(:post, 10)
    
      # get '/api/v1/posts'
      # json = JSON.parse(response.body)
  
      # # リクエスト成功を表す200が返ってきたか確認する。
      # expect(response.status).to eq(200)
  
      # # 正しい数のデータが返されたか確認する。
      # expect(json['data'].length).to eq(10)
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

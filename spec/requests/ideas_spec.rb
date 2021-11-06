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
      invalid_params = { category_name: "", body: "test" }
      expect { post '/api/ideas', params: invalid_params }.to change{Category.count}.by(0).and change{Idea.count}.by(0)
      expect(response.status).to eq(422)
    end
  end
  context 'アイデア名が空のアイデアを登録しようとしたとき' do
    it '登録できない' do
      invalid_params = { category_name: "test", body: "" }
      expect { post '/api/ideas', params: invalid_params }.to change{Category.count}.by(0).and change{Idea.count}.by(0)
      expect(response.status).to eq(422)
    end
  end
end

describe 'アイデア所得API' do
  let(:first_category){create(:category, name: "category1")}
  let(:second_category){create(:category, name: "category2")}
  before do
    create(:idea, body: "idea1", category_id: first_category.id)
    create(:idea, body: "idea2", category_id: first_category.id)
    create(:idea, body: "idea3", category_id: second_category.id)
    create(:idea, body: "idea4", category_id: second_category.id)
  end
  context 'カテゴリ名をリクエストにつけておくったとき' do
    it 'カテゴリ名にひもづくアイデアが所得できる' do
      get '/api/ideas?category_name=category1'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json['data'].length).to eq(2)
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

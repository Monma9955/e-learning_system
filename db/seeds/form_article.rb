# 設問投稿機能で使用するモデル(form_article)の初期データ

# articleレコード作成
20.times do |_n|
  Article.create(
    user_id: 1,
    category_id: 161,
    title: Faker::Company.category,
    price: nil,
    format: 0,
    time_limit: 60,
    public: true
  )
end

# pageレコード作成
20.times do |n|
  Page.create(
    article_id: n + 1,
    text: "テスト用問題文"
  )
end

# Optionレコード作成

20.times do |n|
  Option.create(
    page_id: n + 1,
    answer: "正答",
    correct: true
  )
end

20.times do |n|
  Option.create(
    page_id: n + 1,
    answer: "誤答",
    correct: false
  )
end
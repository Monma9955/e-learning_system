# ルートカテゴリ
bisiness    = Category.create(name: "ビジネススキル")
tech        = Category.create(name: "Web・IT・デザイン")
photo_video = Category.create(name: "写真・映像")
language    = Category.create(name: "英語・語学")
cooking     = Category.create(name: "料理・グルメ")
health      = Category.create(name: "ビューティー・ヘルス")
culture     = Category.create(name: "文化・教養")
quiz        = Category.create(name: "クイズ")
others      = Category.create(name: "その他")

# ビジネススキルの子カテゴリ
bisiness_excel = bisiness.children.create(name: "Excel")
bisiness_speech = bisiness.children.create(name: "スピーチ")
bisiness_communication = bisiness.children.create(name: "ビジネスコミュニケーション")
bisiness_writing = bisiness.children.create(name: "ライティング")
bisiness_finance = bisiness.children.create(name: "会計・ファイナンス")
bisiness_management_strategy = bisiness.children.create(name: "経営戦略・経営分析")
bisiness_others = bisiness.children.create(name: "その他のビジネススキル")
# ビジネススキルの孫カテゴリ
bisiness_excel.children.create([{name: "ピボットテーブル"}, {name: "マクロ・VBA"}])
bisiness_speech.children.create([{name: "自己紹介"}])
bisiness_communication.children.create([{name: "ファシリテーション"}])
bisiness_writing.children.create([{name: "コピーライティング"}])
bisiness_finance.children.create([{name: "会計"}, {name: "ファイナンス"}])
bisiness_management_strategy.children.create([{name: "経営戦略"},
                                              {name: "経営分析"}])
bisiness_others.children.create([{name: "その他"}])

# Web・IT・デザインの子カテゴリ
tech_programing = tech.children.create(name: "プログラミング")
tech_appdevelop = tech.children.create(name: "アプリ開発")
tech_webdirection = tech.children.create(name: "Webディレクション")
tech_htmlcss = tech.children.create(name: "HTML・CSS")
tech_wordpress = tech.children.create(name: "WordPress・HP作成")
tech_webanalytics = tech.children.create(name: "Web解析")
tech_seo = tech.children.create(name: "Webマーケティング・SEO")
tech_web_design = tech.children.create(name: "Webデザイン")
tech_graphic_design = tech.children.create(name: "グラフィックデザイン")
tech_cg_design = tech.children.create(name: "CGデザイン")
tech_fashion_design = tech.children.create(name: "ファッションデザイン")
tech_cad = tech.children.create(name: "CAD・建築デザイン")
tech_others = tech.children.create(name: "その他Web・IT・デザイン")
# Web・IT・デザインの孫カテゴリ
tech_programing.children.create([{name: "Ｃ・Ｃ++・Ｃ#"}, {name: "Git・Github"},
                                 {name: "Javascript・jQuery"}, {name: "PHP"},
                                 {name: "Python"}, {name: "Ｒ"},
                                 {name: "Ruby on Rails"}])
tech_appdevelop.children.create([{name: "Android・Java・Kotlin"},
                                 {name: "iOS・Swift"}])
tech_webdirection.children.create([{name: "Webディレクション"}])
tech_htmlcss.children.create([{name: "CSS3"}, {name: "HTML5"},
                              {name: "SASS・SCSS"}])
tech_wordpress.children.create([{name: "WordPress・HP作成"}])
tech_webanalytics.children.create([{name: "Google Analytics"},
                                   {name: "Tag Manager"}])
tech_seo.children.create([{name: "SEO"}, {name: "リスティング広告"}])
tech_web_design.children.create([{name: "Webデザイン"}])
tech_graphic_design.children.create([{name: "グラフィックデザイン"}])
tech_cg_design.children.create([{name: "CGデザイン"}])
tech_fashion_design.children.create([{name: "ファッションデザイン"}])
tech_cad.children.create([{name: "CAD・建築デザイン"}])
tech_others.children.create([{name: "SNSマーケティング"}, {name: "Facebook"},
                             {name: "LINE"}, {name: "Twitter"},
                             {name: "youtube"}, {name: "インスタグラム"},
                             {name: "パソコンの使い方"}, {name: "Access"},
                             {name: "AWS"}, {name: "MySQL"}, {name: "InDesign"},
                             {name: "タイピング"}, {name: "Zoom"}])

# 写真・映像の子カテゴリ
photo_video_1 = photo_video.children.create(name: "写真（カメラ）基礎")
photo_video_2 = photo_video.children.create(name: "風景・夜景撮影")
photo_video_3 = photo_video.children.create(name: "ポートレート撮影")
photo_video_4 = photo_video.children.create(name: "テーブルフォト・商品撮影")
photo_video_5 = photo_video.children.create(name: "レンズ・ストロボ撮影")
photo_video_6 = photo_video.children.create(name: "スマホ撮影")
photo_video_7 = photo_video.children.create(name: "撮られ方・自撮り")
photo_video_8 = photo_video.children.create(name: "写真加工(フォトレタッチ)")
photo_video_9 = photo_video.children.create(name: "動画編集・映像編集")
photo_video_10 = photo_video.children.create(name: "その他")
# 写真・映像の孫カテゴリ
photo_video_1.children.create([{name: "写真（カメラ）基礎"}])
photo_video_2.children.create([{name: "風景・夜景撮影"}])
photo_video_3.children.create([{name: "ポートレート撮影"}])
photo_video_4.children.create([{name: "テーブルフォト・商品撮影"}])
photo_video_5.children.create([{name: "レンズ・ストロボ撮影"}])
photo_video_6.children.create([{name: "スマホ撮影"}])
photo_video_7.children.create([{name: "撮られ方・自撮り"}])
photo_video_8.children.create([{name: "Lightroom"}])
photo_video_9.children.create([{name: "After Effects"}, {name: "Premiere Pro"}])
photo_video_10.children.create([{name: "動画撮影"}])

# 英語・語学の子カテゴリ
language_1 = language.children.create(name: "英会話")
language_2 = language.children.create(name: "ビジネス英語")
language_3 = language.children.create(name: "英語学習法")
language_4 = language.children.create(name: "TOEIC対策")
language_5 = language.children.create(name: "中国語")
language_6 = language.children.create(name: "韓国語")
language_7 = language.children.create(name: "フランス語")
language_8 = language.children.create(name: "イタリア語")
language_9 = language.children.create(name: "その他の外国語・語学")
# 英語・語学の孫カテゴリ
language_1.children.create([{name: "英会話"}])
language_2.children.create([{name: "ビジネス英語"}])
language_3.children.create([{name: "リスニング"}, {name: "英文法"}, {name: "発音"}])
language_4.children.create([{name: "TOEIC対策"}])
language_5.children.create([{name: "中国語"}])
language_6.children.create([{name: "韓国語"}])
language_7.children.create([{name: "フランス語"}])
language_8.children.create([{name: "イタリア語"}])
language_9.children.create([{name: "その他の外国語・語学"}])

# 料理・グルメの子カテゴリ
cooking_1 = cooking.children.create(name: "料理")
cooking_2 = cooking.children.create(name: "お菓子作り")
cooking_3 = cooking.children.create(name: "パン作り")
cooking_4 = cooking.children.create(name: "包丁の研ぎ方")
cooking_5 = cooking.children.create(name: "ワイン")
cooking_6 = cooking.children.create(name: "日本酒・利き酒")
cooking_7 = cooking.children.create(name: "カクテル・ウィスキー")
cooking_8 = cooking.children.create(name: "紅茶")
cooking_9 = cooking.children.create(name: "コーヒー")
cooking_10 = cooking.children.create(name: "グルメ・食文化")
cooking_11 = cooking.children.create(name: "その他料理・グルメ講座")
# 料理・グルメの孫カテゴリ
cooking_1.children.create([{name: "タイ・エスニック"}, {name: "作り置き・時短"},
                           {name: "寿司"}, {name: "中華"}, {name: "洋食"},
                           {name: "和食"}])
cooking_2.children.create([{name: "アイシングクッキー"}, {name: "ケーキ・クッキー"},
                           {name: "和菓子"}])
cooking_3.children.create([{name: "パン作り"}])
cooking_4.children.create([{name: "包丁の研ぎ方"}])
cooking_5.children.create([{name: "ワイン"}])
cooking_6.children.create([{name: "日本酒・利き酒"}])
cooking_7.children.create([{name: "カクテル・ウィスキー"}])
cooking_8.children.create([{name: "紅茶"}])
cooking_9.children.create([{name: "ラテアート"}])
cooking_10.children.create([{name: "グルメ・食文化"}])
cooking_11.children.create([{name: "スパイス・ハーブ"}, {name: "魚のさばき方"},
                            {name: "ビール"}])

# ビューティー・ヘルスの子カテゴリ
health_1 = health.children.create(name: "スキンケア")
health_2 = health.children.create(name: "健康法")
# ビューティー・ヘルスの孫カテゴリ
health_1.children.create([{name: "スキンケア"}])
health_2.children.create([{name: "栄養学"}])

# 文化・教養の子カテゴリ
culture_1 = culture.children.create(name: "きもの着付け")
culture_2 = culture.children.create(name: "マナー・おもてなし")
culture_3 = culture.children.create(name: "一般教養")
# 文化・教養の孫カテゴリ
culture_1.children.create([{name: "きもの着付け"}])
culture_2.children.create([{name: "マナー・おもてなし"}])
culture_3.children.create([{name: "一般教養"}])

# クイズの子カテゴリ
quiz_1 = quiz.children.create(name: "クイズ")
# クイズの孫カテゴリ
quiz_1.children.create([{name: "クイズ"}])

# その他の子カテゴリ
others_1 = others.children.create(name: "その他")
# その他の孫カテゴリ
others_1.children.create([{name: "その他"}])

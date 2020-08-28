# フィーチャスペックのテスト用seedファイル

# カテゴリ(３世代)
bisiness = Category.create(name: "test ビジネススキル")
bisiness_excel = bisiness.children.create(name: "test Excel")
bisiness_excel.children.create([{name: "test ピボットテーブル"}, {name: "マクロ・VBA"}])

# 初期ユーザー
users = [
  { nickname: "出題者", email: "test@example.com", password: "test1234" },
  { nickname: "回答者", email: "test2@example.com", password: "test1234" }
]
users.each do |record|
  User.create!(record) unless User.find_by(email: record[:email])
end

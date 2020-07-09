# DB設計

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, index: true|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
|birth_on|date||
|profile|text||
|image|string||

### Association

- has_one :user_name, dependent: :destroy
- has_many :administrators, dependent: :destroy
- has_many :contents, through: :administrators

- has_many :transactions, dependent: :destroy
- has_many :contents, through: :transactions
- has_one :recommend_transaction, -> {where(recommend: true)}, class_name: 'Transaction'
- has_one :recommend_content, through: :recommend_transaction, source: :content

- has_many :groups, dependent: :destroy

- has_many :users_groups, dependent: :destroy
- has_many :groups, through: :users_groups

- has_many :relationships, dependent: :delete
- has_many :followings, through: :relationships, source: :followed
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id'
- has_many :followers, through: :reverse_of_relationships, source: :follower

## User_namesテーブル

|Column|Type|Options|
|------|----|-------|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|

### Association

- belongs_to :user

## Groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|name|string|null: false|

### Association

- belongs_to :user
- has_many :users_groups, dependent: :destroy
- has_many :groups, through: :users_groups
- has_many :groups_contents, dependent: :destroy
- has_many :contents, through: groups_contents

## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

### Association

- has_ancestry
- has_many :articles

## Articlesテーブル

|Column|Type|Options|
|------|----|-------|
|category|references|null: false, foreign_key: true|
|title|string|null: false, index: true|
|price|integer||

### Association

- belongs_to :category
- has_many :contents, dependent: :destroy

## Contentsテーブル

|Column|Type|Options|
|------|----|-------|
|article|references|null: false, foreign_key: true|
|title|string|null: false, index: true|
|price|integer|index: true|
|draft|boolean|default: false, null: false|

### Association

- belongs_to :article
- has_many :texts, dependent: :delete_all
- has_many :images, dependent: :delete_all
- has_many :administrators, dependent: :destroy
- has_many :users, through: :administrators
- has_many :transactions, dependent: :destroy
- has_many :users, through: :transactions

## textsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||

### Association

- belongs_to :content

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string||

### Association

- belongs_to :content

以下中間テーブル

## Relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follower|references|foreign_key: {to_table: users}|
|followed|references|foreign_key: {to_table: users}|

### Association

- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## users_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belogns_to :group

## groups_contentsテーブル

|Column|Type|Options|
|------|----|-------|
|group_id|references|null: false, foreign_key: true|
|content_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belogns_to :group

## administratorsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|content|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :content

## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|content|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :content
# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false , unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|evaluation|integer||

### Association
- has_one  :address
- has_one  :profile
- has_one  :phonenumber
- has_many :cards
- has_many :items
- has_many :comments

## phonenumber table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|phonenumber|integer|null: false , unique: true||

### Association
- belongs_to :user

## profiles table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|introduction|text||
|image|string||
|nickname|string|null: false|

### Association
- belongs_to :user

## addresses table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_address|string|null: false|
|building|string||
|telnumber|integer||

### Association
- belongs_to :user

## cards table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## items table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|category_id|references|null: false , foreign_key: true|
|name|string|index: true , null: false|
|description|text||
|brand|string|
|size|string||
|condition|string|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category
- has_one :delivery
- has_many :comments
- has_many :images

## deliveries table

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false , foreign_key: true|
|payer|string|null: false|
|method|string|null: false|
|area|string|null: false|
|date|string|

### Association
- belongs_to :item

## images table

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false , foreign_key: true|
|file|string|null: false|

### Association
- belongs_to :item

## comments table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|item_id|references|null: false , foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## categories table

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false , foreign_key: true|
|ancestry|string|null: false, index: true|

### Association
- belongs_to :item
- has_ancestry

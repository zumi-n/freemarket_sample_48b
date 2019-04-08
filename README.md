# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|email|string|null: false , unique: true|
|phone_number|string|null: false , unique: true|
|password|string|null: false|
|card|string||
|evaluation|integer|

### Association
- has_one  :address
- has_one  :profile
- has_many :cards
- has_many :items
- has_many :comments

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
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street_address|string|null: false|
|building|string||

### Association
- belongs_to :user

## cards table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|numbser|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|owner|string|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user

## items table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|small_category_id|references|null: false , foreign_key: true|
|name|string|index: true , null: false|
|description|text||
|brand|string|
|size|string||
|condition|string|null: false|
|delivery_burden|string|null: false|
|delivery_method|string|null: false|
|delivery_area|string|null: false|
|delivery_date|string|

### Association
- belongs_to :user
- belongs_to :small_category
- has_one  :value
- has_many :comments
- has_many :images

## values table

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false , foreign_key: true|
|price|integer|null: false|
|profit|integer|null: false|

### Association
- belongs_to :item

## images table

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false , foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item

## comments table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false , foreign_key: true|
|item_id|references|null: false , foreign_key: true|
|comment|text||

### Association
- belongs_to :user
- belongs_to :item

## small_categorys table

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false , foreign_key: true|
|small_category|string|null: false|

### Association
- belongs_to :item
- has_many :medium_categorys

## medium_categorys table

|Column|Type|Options|
|------|----|-------|
|small_category_id|references|null: false , foreign_key: true|
|medium_category|string|null: false|

### Association
- belongs_to :small_category
- has_many :small_categorys

## Large_categorys table

|Column|Type|Options|
|------|----|-------|
|medium_category_id|references|null: false , foreign_key: true|
|Large_category|string|null: false|

### Association
- has_many :medium_categorys



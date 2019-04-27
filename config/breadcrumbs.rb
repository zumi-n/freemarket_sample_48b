crumb :root do
  link "メルカリ", root_path
end

crumb :item do |item|
  link "#{item.name}", item_path(params[:id])
end

crumb :profiles do
  link 'マイページ', profiles_path
end

crumb :profile do |profile|
  link "プロフィール", edit_profile_path(params[:id])
  parent :profiles
end

crumb :user do |user|
  link "ログアウト", logout_user_path(params[:id])
  parent :profiles
end

crumb :user do |user|
  link "本人情報の登録", register_user_path(params[:id])
  parent :profiles
end

crumb :cards do
  link "支払い方法", cards_path
  parent :profiles
end

crumb :card do |card|
  link "クレジットカード情報入力", new_card_path(params[:id])
  parent :cards
end

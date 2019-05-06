crumb :root do
  link "メルカリ", root_path
end

crumb :item do |item|
  link "#{item.name}", item_path(params[:id])
end

crumb :users do
  link 'マイページ', users_path(params[:id])
end

crumb :edit_user do |user|
  link "プロフィール", edit_user_path(user)
  parent :users
end

crumb :logout_user do |user|
  link "ログアウト", logout_user_path(user)
  parent :users
end

crumb :register_user do |user|
  link "本人情報の登録", register_user_path(user)
  parent :users
end


crumb :cards do
  link "支払い方法", cards_path
  parent :users
end

crumb :card do |card|
  link "クレジットカード情報入力", new_card_path(params[:id])
  parent :cards
end

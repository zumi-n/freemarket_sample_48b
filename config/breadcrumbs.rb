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



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
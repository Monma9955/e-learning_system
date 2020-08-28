require 'rails_helper'

feature '記事の投稿', type: :feature do

  background(:each) do
    load "#{Rails.root}/db/seeds/test/test.rb"
  end

  let(:user) { create(:user) }

  scenario '記事を投稿する', js: true do
    # ログインせずに記事投稿ボタンを押すとログイン画面がrenderされる(リダイレクトはしない)
    visit root_path
    click_on '新規作成'
    expect(current_path).to eq new_article_path
    expect(page).to have_content 'この機能を使用するにはアカウント登録、もしくはログインが必要です。'

    # ログイン処理
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click

    # ログインすると投稿画面がrenderされる
    expect(page).to have_content 'ログインしました'
    expect(page).to have_content '出題形式'
    expect(page).to have_content 'カテゴリー'
    expect(page).to have_content 'タイトル'

    # 設問の投稿で各テーブルにレコードが増えている
    expect{ 
      select '複数選択問題', from: 'article_format'
      select 'test ビジネススキル', from: 'articleCategory'
      select 'test Excel', from: 'parentCategory'
      select 'test ピボットテーブル', from: 'childCategory'
      fill_in 'form_article_article_title', with: 'ピボットテーブル基礎'
      fill_in 'form_article_page_text', with: '集計させたい値を入れるセクションはどれか？'
      fill_in 'form_article_option_correct', with: '値'
      fill_in 'form_article_option_wrong', with: '行'
      fill_in 'form_article_article_price', with: '250'
      fill_in 'form_article_article_time_limit', with: '60'
      check 'form_article_article_public'
      click_button '問題作成'
       }.to change(Article, :count).by(1) & change(Page, :count).by(1) & change(Option, :count).by(2)
  end
end
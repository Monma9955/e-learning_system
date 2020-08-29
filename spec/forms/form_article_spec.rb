require 'rails_helper'

RSpec.describe FormArticle, type: :model do

  describe '#create' do
    context '○ 投稿可能' do
      it "問題投稿フォームの内容がすべて指定通りに存在すれば投稿できること" do
        expect(build(:form_article)).to be_valid
      end

      context 'article_categoryカラム' do
        it "DBに存在しているカテゴリでは投稿できること" do
          article = build(:form_article, article_category: 165)
          expect(article).to be_valid
        end
      end

      context 'article_formatカラム' do
        it "enumに存在する出題形式では投稿できること" do
          article = build(:form_article, article_format: 1)
          expect(article).to be_valid
        end
      end

      context 'article_titleカラム' do
        it "30文字では投稿できること" do
          article = build(:form_article, article_title: "あ" * 30)
          expect(article).to be_valid
        end
      end

      context 'page_textカラム' do
        it "1,000文字では投稿できること" do
          article = build(:form_article, page_text: "あ" * 1000)
          expect(article).to be_valid
        end
      end

      context 'option(correct, wrong)カラム' do
        it "200文字では投稿できること(correct)" do
          article = build(:form_article, option_correct: "あ" * 200)
          expect(article).to be_valid
        end

        it "200文字では投稿できること(wrong)" do
          article = build(:form_article, option_wrong: "あ" * 200)
          expect(article).to be_valid
        end
      end

      context 'article_priceカラム' do
        it "空欄でも投稿できること" do
          article = build(:form_article, article_price: nil)
          expect(article).to be_valid
        end

        it "¥100では投稿できること" do
          article = build(:form_article, article_price: 100)
          expect(article).to be_valid
        end

        it "¥999,999では投稿できること" do
          article = build(:form_article, article_price: 999_999)
          expect(article).to be_valid
        end
      end

      context 'article_time_limitカラム' do
        it "空欄でも投稿できること" do
          article = build(:form_article, article_time_limit: nil)
          expect(article).to be_valid
        end

        it "1(分)では投稿できること" do
          article = build(:form_article, article_time_limit: 1)
          expect(article).to be_valid
        end

        it "120(分)では投稿できること" do
          article = build(:form_article, article_time_limit: 120)
          expect(article).to be_valid
        end

      end
    end
    context '× 投稿不可' do
      context 'created_user_idカラム' do
        it "ユーザーIDがない場合は登録できないこと" do
          article = build(:form_article, created_user_id: nil)
          article.valid?
          expect(article.errors[:created_user_id]).to include("を入力してください")
        end

        it "ユーザーIDが2バイト文字では登録できないこと" do
          article = build(:form_article, created_user_id: "１")
          article.valid?
          expect(article.errors[:created_user_id]).to include()
        end
      end

      context 'article_categoryカラム' do
        it "カテゴリが選択されていない場合は投稿できないこと" do
          article = build(:form_article, article_category: nil)
          article.valid?
          expect(article.errors[:article_category]).to include("を入力してください")
        end

        it "カテゴリIDが2バイト文字では投稿できないこと" do
          article = build(:form_article, article_category: "１")
          article.valid?
          expect(article.errors[:article_category]).to include()
        end
      end

      context 'article_formatカラム' do
        it "出題形式がない場合は投稿できないこと" do
          article = build(:form_article, article_format: nil)
          article.valid?
          expect(article.errors[:article_format]).to include("を入力してください")
        end

        it "enumに存在しない出題形式では投稿できないこと" do
          article = build(:form_article, article_format: 2)
          article.valid?
          expect(article.errors[:article_format]).to include()
        end

        it "出題形式が2バイト文字では投稿できないこと" do
          article = build(:form_article, article_format: "１")
          article.valid?
          expect(article.errors[:article_format]).to include()
        end
      end

      context 'article_titleカラム' do
        it "空欄の場合は投稿できないこと" do
          article = build(:form_article, article_title: nil)
          article.valid?
          expect(article.errors[:article_title]).to include("を入力してください")
        end

        it "31文字以上では投稿できないこと" do
          article = build(:form_article, article_title: "あ" * 31)
          article.valid?
          expect(article.errors[:article_title]).to include("は30文字以内で入力してください")
        end
      end

      context 'page_textカラム' do
        it "空欄の場合は投稿できないこと" do
          article = build(:form_article, page_text: nil)
          article.valid?
          expect(article.errors[:page_text]).to include("を入力してください")
        end

        it "1001文字以上では投稿できないこと" do
          article = build(:form_article, page_text: "あ" * 1001)
          article.valid?
          expect(article.errors[:page_text]).to include("は1000文字以内で入力してください")
        end
      end

      context 'option(correct, wrong)カラム' do
        it "空欄の場合は投稿できないこと(correct)" do
          article = build(:form_article, option_correct: nil)
          article.valid?
          expect(article.errors[:option_correct]).to include("を入力してください")
        end

        it "201文字以上では投稿できないこと(correct)" do
          article = build(:form_article, option_correct: "あ" * 201)
          article.valid?
          expect(article.errors[:option_correct]).to include("は200文字以内で入力してください")
        end

        it "空欄の場合は投稿できないこと(wrong)" do
          article = build(:form_article, option_wrong: nil)
          article.valid?
          expect(article.errors[:option_wrong]).to include("を入力してください")
        end

        it "201文字以上では投稿できないこと(wrong)" do
          article = build(:form_article, option_wrong: "あ" * 201)
          article.valid?
          expect(article.errors[:option_wrong]).to include("は200文字以内で入力してください")
        end
      end

      context 'article_priceカラム' do
        it "¥99では投稿できないこと" do
          article = build(:form_article, article_price: 99)
          article.valid?
          expect(article.errors[:article_price]).to include("は正しくありません")
        end

        it "¥1,000,000では投稿できないこと" do
          article = build(:form_article, article_price: 1_000_000)
          article.valid?
          expect(article.errors[:article_price]).to include("は正しくありません")
        end

        it "２バイト文字では投稿できないこと" do
          article = build(:form_article, article_price: "１００")
          article.valid?
          expect(article.errors[:article_price]).to include("は正しくありません")
        end
      end
      context 'article_time_limitカラム' do
        it "121(分)では投稿できないこと" do
          article = build(:form_article, article_time_limit: 121)
          article.valid?
          expect(article.errors[:article_time_limit]).to include("は正しくありません")
        end

        it "２バイト文字では投稿できないこと" do
          article = build(:form_article, article_time_limit: "１２０")
          article.valid?
          expect(article.errors[:article_time_limit]).to include("は正しくありません")
        end
      end
    end
  end
end

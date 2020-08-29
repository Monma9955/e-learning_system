require 'rails_helper'

describe ArticlesController do
  let(:user) { create(:user) }

  describe 'GET #new' do

    context 'ログインしている場合' do

      before do
        login user
        get :new
      end

      it "@articleに期待した値が入っていること" do
        expect(assigns(:article)).to be_an_instance_of FormArticle
      end

      it "new.html.hamlに遷移すること" do
        expect(response).to render_template :new
      end

    end

    context 'ログインしていない場合' do

      before do
        get :new
      end

      it "ログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe 'POST #create' do
    let(:params) { { created_user_id: user.id, form_article: attributes_for(:form_article) } }

    context 'ログインしている場合' do

      before do
        login user
        create(:category)
      end

      context '投稿に成功した場合' do
        subject {
          post :create,
          params: params
        }

        it "articleを保存すること" do
          expect{ subject }.to change(Article, :count).by(1)
        end

        it "pageを保存すること" do
          expect{ subject }.to change(Page, :count).by(1)
        end

        it "optionを保存すること" do
          expect{ subject }.to change(Option, :count).by(2)
        end

        it "root_pathへリダイレクトすること" do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context '投稿に失敗した場合' do
        let(:invalid_params) { { created_user_id: user.id, form_article: attributes_for(:form_article, article_title: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it "Articleを保存しないこと" do
          expect{ subject }.not_to change(Article, :count)
        end

        it "Pageを保存しないこと" do
          expect{ subject }.not_to change(Page, :count)
        end

        it "Optionを保存しないこと" do
          expect{ subject }.not_to change(Option, :count)
        end

        it "new.html.hamlに遷移すること" do
          subject
          expect(response).to render_template :new
        end
      end

    end

    context 'ログインしていない場合' do

      it "ログイン画面にリダイレクトすること" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end

    end
  end
end
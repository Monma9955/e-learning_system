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

end
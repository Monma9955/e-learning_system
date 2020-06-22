require 'rails_helper'

describe User do
  describe '#create' do
    context '登録可能' do
      it "nicknameとemailとpasswordがすべて指定通りに存在すれば登録できること" do
        expect(build(:user)).to be_valid
      end

      context 'nicknameカラム' do
        it "nicknameが2文字以上では登録できること" do
          user = build(:user, nickname: "太郎")
          expect(user).to be_valid
        end

        it "nicknameが14文字以下では登録できること" do
          user = build(:user, nickname: "テスト太郎テスト太郎テスト太")
          expect(user).to be_valid
        end
      end

      context 'emailカラム' do
        it "emailが「半角英数 + @ + 半角英数 + . + 半角英字」の形になっている場合登録できること" do
          user = build(:user, email: "aa12@aa12.com")
          expect(user).to be_valid
        end
      end

      context 'passwordカラム' do
        it "passwordが8文字以上では登録できること" do
          user = build(:user, password: "sample00")
          expect(user).to be_valid
        end

        it "passwordが100文字以下では登録できること" do
          user = build(:user, password: "a" * 99 + "0")
          expect(user).to be_valid
        end

        it "passwordに半角数字が1文字含まれている場合は登録できること" do
          user = build(:user, password: "abcdefg0")
          expect(user).to be_valid
        end

        it "passwordに半角英字が1文字含まれている場合は登録できること" do
          user = build(:user, password: "1234567a")
          expect(user).to be_valid
        end

        it "passwordの英字が大文字の場合保存できること" do
          user = build(:user, password: "ABCD1234")
          expect(user).to be_valid
        end

        it "passwordの英字が大文字小文字混在している場合保存できること" do
          user = build(:user, password: "abCD1234")
          expect(user).to be_valid
        end
      end
    end

    context '登録不可' do
      context 'nicknameカラム' do
        it "nicknameがない場合は登録できないこと" do
          user = build(:user, nickname: nil)
          user.valid?
          expect(user.errors[:nickname]).to include("can't be blank").and include("is too short (minimum is 2 characters)")
        end

        it "重複したnicknameが存在する場合は登録できないこと" do
          user = create(:user)
          another_user = build(:user, nickname: user.nickname)
          another_user.valid?
          expect(another_user.errors[:nickname]).to include("has already been taken")
        end

        it "nicknameが1文字では登録できないこと" do
          user = build(:user, nickname: "太")
          user.valid?
          expect(user.errors[:nickname]).to include("is too short (minimum is 2 characters)")
        end

        it "nicknameが15文字以上では登録できないこと" do
          user = build(:user, nickname: "テスト太郎テスト太郎テスト太郎")
          user.valid?
          expect(user.errors[:nickname]).to include("is too long (maximum is 14 characters)")
        end
      end

      context 'emailカラム' do
        it "emailがない場合は登録できないこと" do
          user = build(:user, email: nil)
          user.valid?
          expect(user.errors[:email]).to include("can't be blank")
        end

        it "重複したemailが存在する場合は登録できないこと" do
          user = create(:user)
          another_user = build(:user, email: user.email)
          another_user.valid?
          expect(another_user.errors[:email]).to include("has already been taken")
        end

        it "emailに日本語が含まれている場合は登録できないこと" do
          user = build(:user, email: "てst@example.com")
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end

        it "emailに@が含まれていない場合は登録できないこと" do
          user = build(:user, email: "testexample.com")
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end
      end

      context 'passwordカラム' do
        it "passwordがない場合は登録できないこと" do
          user = build(:user, password: nil)
          user.valid?
          expect(user.errors[:password]).to include("can't be blank")
        end

        it "passwordが7文字以下では登録できないこと" do
          user = build(:user, password: "sample0")
          user.valid?
          expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
        end

        it "passwordが100文字以上では登録できないこと" do
          user = build(:user, password: "a" * 100 + "0")
          user.valid?
          expect(user.errors[:password]).to include("is too long (maximum is 100 characters)")
        end

        it "passwordに含まれる数字が全角の場合は登録できないこと" do
          user = build(:user, password: "abcdefg０")
          user.valid?
          expect(user.errors[:password]).to include("is invalid")
        end

        it "passwordに半角数字が含まれていない場合は登録できないこと" do
          user = build(:user, password: "abcdefgh")
          user.valid?
          expect(user.errors[:password]).to include("is invalid")
        end

        it "passwordに含まれる英字が全角の場合は登録できないこと" do
          user = build(:user, password: "1234567ａ")
          user.valid?
          expect(user.errors[:password]).to include("is invalid")
        end

        it "passwordに半角英字が含まれていない場合は登録できないこと" do
          user = build(:user, password: "12345678")
          user.valid?
          expect(user.errors[:password]).to include("is invalid")
        end

        it "passwordに日本語が含まれている場合は登録できないこと" do
          user = build(:user, password: "abcd123あ")
          user.valid?
          expect(user.errors[:password]).to include("is invalid")
        end
      end
    end
  end
end
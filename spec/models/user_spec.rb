require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての必須項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'nameが11文字以上だと登録できない' do
        @user.name = 'あいうえおかきくけこさ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is too long (maximum is 10 characters)"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'testtest99'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'asda1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aabbcc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は少なくとも1つの英字と1つの数字を含める必要があります"
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'らいおんはつよい'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は少なくとも1つの英字と1つの数字を含める必要があります"
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '112233'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は少なくとも1つの英字と1つの数字を含める必要があります"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'aabbcc1'
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
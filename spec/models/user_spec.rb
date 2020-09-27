require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、姓、名、カナ、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '123g56'
          @user.password_confirmation = '123g56'
          expect(@user).to be_valid
        end

        it 'last_nameがあれば登録できる' do
          @user.last_name = '龍之介リュウのすけ'
          expect(@user).to be_valid
        end

        it 'first_nameがあれば登録できる' do
          @user.first_name = '芥川あくたガワ'
          expect(@user).to be_valid
        end

        it 'last_name_kanaがカタカナであれば登録できる' do
          @user.last_name_kana = 'カタカナ'
          expect(@user).to be_valid
        end

        it 'first_name_kanaがカタカナであれば登録できる' do
          @user.first_name_kana = 'ヒラガナ'
          expect(@user).to be_valid
        end

        it 'birthdayがあれば登録できる' do
          @user.birthday = '2014-09-23'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailが重複している場合登録できない事' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'last_name_kanaが空では登録できないこと' do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it 'last_nameは全角漢字、ひらがな、カタカナでなければ登録できない' do
          @user.last_name = 'abc1'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end

        it 'first_nameは全角漢字、ひらがな、カタカナでなければ登録できない' do
          @user.first_name = '5bc1'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end

        it 'last_name_kanaは全角カタカナでなければ登録できない' do
          @user.last_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid')
        end

        it 'first_name_kanaは全角カタカナでなければ登録できない' do
          @user.first_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end

        it 'emailに@mが含まれていなければ登録できないこと' do
          @user.email = 'azxcvvkj'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
      end
    end
  end
end

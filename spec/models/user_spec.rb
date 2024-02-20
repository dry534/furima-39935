require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '異常系' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailが＠を含まないと登録できない' do
      @user = Faker::Internet.email
      expect(@user).to include('@')
    end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが5文字以下では登録できない' do
      password = Faker::Alphanumeric.alphanumeric(number: 5, min_numeric: 1)
      @user = FactoryBot.build(:user, password: password, password_confirmation: password)
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwardとpassword_confirmationは、値の一致が必須であること。' do
      @user = User.new(email: Faker::Internet.unique.email, password: 'password', password_confirmation: 'different_password')
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
  end



  it 'family_nameが空では登録できない' do
    @user.family_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Family name can't be blank"
end

it 'first_name_kanaが空では登録できない' do
  @user.first_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include "First name kana can't be blank"
end

it 'first_name_kanaが全角カナ文字以外で登録できない' do
  @user.first_name_kana = 'タカシ123'
  expect(@user).not_to be_valid
  expect(@user.errors.full_messages).to include('First name kana is invalid')
end

it 'family_name_kanaが空では登録できない' do
  @user.family_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include "Family name kana can't be blank"
end

it 'family_name_kanaが全角カナ文字以外で登録できない' do
  @user.family_name_kana = 'ヤマダ123'
  expect(@user).not_to be_valid
  expect(@user.errors.full_messages).to include('Family name kana is invalid')
end

it 'birthdayが空では登録できない' do
  @user.birthday = ''
  @user.valid?
  expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  
    context '正常系' do
  end
end
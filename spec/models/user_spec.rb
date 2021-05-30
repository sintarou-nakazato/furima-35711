require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき'
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
    it 'family_nameが無い場合は登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'first_nameが無い場合は登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'family_name_kanaが無い場合登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it 'first_name_kanaが無い場合登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'birth_dayが無い場合は登録できないこと' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it '重複したemailが存在する場合は登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが6文字以上であれば登録できる' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      expect(@user).to be_valid
    end
    it 'passwordが存在してもencrypted_passwordが無い場合は登録できないこと' do
      @user.encrypted_password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Encrypted password can't be blank")
    end
    it 'emailに@がなければ登録できない' do
      @user.email = 'i'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'family_nameが全角でなければ登録できない' do
      @user.family_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name is invalid'
    end
    it 'first_nameが全角でなければ登録できない' do
      @user.first_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'family_name_kanaが全角カタカナでななければ登録できない' do
      @user.family_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana is invalid'
    end
    it 'first_name_kanaが全角カタカナ出なければ登録できない' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'passwordが半角英数字でなければ登録できない' do
      @user.password = 'ABC'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password",
                                                    'Password is too short (minimum is 6 characters)'
    end
    it 'すべての項目の入力が存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
end

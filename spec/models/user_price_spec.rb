require 'rails_helper'

RSpec.describe UserPrice, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @user_price = FactoryBot.build(:user_price, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe 'user_priceの保存' do
    context 'user_priceが保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_price).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @user_price.building = nil
        expect(@user_price).to be_valid
      end

      it 'phone_numberが11桁であれば保存できる' do
        @user_price.phone_number = '12345678910'
        expect(@user_price).to be_valid
      end
    end

    context 'user_priceが保存できない場合' do
      it 'tokenが空では登録できないこと' do
        @user_price.token = nil
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @user_price.postal_code = nil
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @user_price.city = nil
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @user_price.house_number = nil
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include("House number can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_price.postal_code = '1234567'
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecturalが1だと保存できないこと' do
        @user_price.prefectural_id = 1
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include('Prefectural must be other than 1')
      end

      it 'phone_numberが空では保存できないこと' do
        @user_price.phone_number = nil
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁では保存できないこと' do
        @user_price.phone_number = '123456789123'
        @user_price.valid?
        expect(@user_price.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end

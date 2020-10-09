require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe 'itemの保存' do
    context 'itemが保存できる場合' do
      it 'name、item_text、price、icategory_id、delivery_free_id、product_condition_id、delivery_source_id、estimated_delivery_id、imageがあれば保存できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字であれば保存できる' do
        @item.price = '7000'
        expect(@item).to be_valid
      end

      it 'priceが300から9999999であれば保存できる' do
        @item.price = '6000'
        expect(@item).to be_valid
      end
    end

    context 'itemが保存できない場合' do
      it 'nameが空の場合保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'category_idが空の場合保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'priceが空の場合保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'item_textが空の場合保存できない' do
        @item.item_text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end

      it 'delivery_free_idが1の場合保存できない' do
        @item.delivery_free_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery free must be other than 1')
      end

      it 'product_condition_idが１の場合保存できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Product condition must be other than 1')
      end

      it 'delivery_source_idが１の場合保存できない' do
        @item.delivery_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery source must be other than 1')
      end

      it 'estimated_delivery_idが１の場合保存できない' do
        @item.estimated_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Estimated delivery must be other than 1')
      end

      it 'imageが空の場合保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'ユーザーが紐付いていないとitemは保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '値段は半角数字でなければ保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '値段が300から9999999の間でなければ保存できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
    end
  end
end

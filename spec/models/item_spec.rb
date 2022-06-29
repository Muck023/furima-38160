require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productが空では登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'messageが空では登録できない' do
        @item.message = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Message can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idに「---」が選択されている場合では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idに「---」が選択されている場合では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'defrayment_idが空では登録できない' do
        @item.defrayment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Defrayment can't be blank")
      end
      it 'defrayment_idに「---」が選択されている場合では登録できない' do
        @item.defrayment_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Defrayment can't be blank")
      end
      it 'region_idが空では登録できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idに「---」が選択されている場合では登録できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'reach_idが空では登録できない' do
        @item.reach_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Reach can't be blank")
      end
      it 'reach_idに「---」が選択されている場合では登録できない' do
        @item.reach_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Reach can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが¥9,999,999より高いと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが全角数値だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

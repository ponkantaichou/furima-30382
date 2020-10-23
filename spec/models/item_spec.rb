require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    describe '商品出品' do
      context "商品登録に成功する時" do
        it '入力項目が全て正しく入力された時、登録に成功する' do
          @item.valid?
        end
      end
      
  
      context '新規登録に失敗する時' do
        it '商品名が空欄の時' do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it '商品の説明が空欄の時' do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it '商品の説明が空欄の時' do
          @item.description = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'カテゴリーの選択が未選択の時' do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'カテゴリーの選択が１の時' do
          @item.category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it '商品の選択が未選択の時' do
          @item.status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
          
        it '商品の状態IDが１の時' do
          @item.status_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it '配送料の選択が未選択の時' do
          @item.shipping_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping can't be blank")
        end

        it '配送料のIDが1の時' do
          @item.shipping_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping must be other than 1")
        end

        it '発送元の選択が未選択の時' do
          @item.shipment_source_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipment source can't be blank")
        end

        it '発送元のIDが1の時' do
          @item.shipment_source_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
        end

        it '発送日の選択が未選択の時' do
          @item.shipping_day_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end

        it '発送日のIDが1の時' do
          @item.shipping_day_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end

        it '価格が空欄の時' do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格が300以下の時' do
          @item.price = "299"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        
        it '価格が9999999以上の時' do
          @item.price = "1000000000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it '価格が半角数字以外の時' do
          @item.price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it '画像が入ってない時' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
end
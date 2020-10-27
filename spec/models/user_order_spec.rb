require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品の購入' do
    context '商品登録に成功する時' do
      it '入力項目が全て正しく入力された時、登録に成功する' do
        @user_order.valid?
      end
    end
  end

  context '購入に失敗する時' do
    it 'トークンが空の時購入に失敗する' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空の時失敗する' do
      @user_order.postal_code = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがない時失敗する' do
      @user_order.postal_code = '2223333'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postal code is invalid')
    end

    it '都道府県が空の時失敗する' do
      @user_order.prefectures_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '市区町村が空の時失敗する' do
      @user_order.municipality = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が空の時失敗する' do
      @user_order.address = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空の時失敗する' do
      @user_order.phone_number = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にハイフンが含まれている時失敗する' do
      @user_order.phone_number = '090-2222-3333'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号が12桁以上の時失敗する' do
      @user_order.phone_number = '090111111111111'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number is invalid')
    end
  end
end

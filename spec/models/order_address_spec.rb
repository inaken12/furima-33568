require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep(0.1)
    end

    context '商品購入ができる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'address_line_2は空でも保存できること' do
        @order_address.address_line_2 = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが空では保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'zipcodeが空では保存できないこと' do
        @order_address.zipcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode can't be blank")
      end

      it 'zipcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.zipcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zipcode Input correctly')
      end

      it 'stateが紐付いていないと保存できないこと' do
        @order_address.state_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('State Select')
      end

      it 'state_idが1では保存できないこと' do
        @order_address.state_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('State Select')
      end

      it 'cityが空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address_line_1が空では保存できないこと' do
        @order_address.address_line_1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line 1 can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberはハイフン無しで11桁もしくは10桁でなければ保存できないこと' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'phone_numberが全角数字では保存できないこと' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

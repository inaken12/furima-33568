require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての情報が適切に存在すれば商品出品できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryが紐付いていないと保存できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'category_idが1では保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'conditionが紐付いていないと保存できないこと' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it 'condition_idが1では保存できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it 'shipping_feeが紐付いていないと保存できないこと' do
      @item.shipping_fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee Select')
    end

    it 'shipping_fee_idが1では保存できないこと' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee Select')
    end

    it 'stateが紐付いていないと保存できないこと' do
      @item.state = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('State Select')
    end

    it 'state_idが1では保存できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State Select')
    end

    it 'shipping_dayが紐付いていないと保存できないこと' do
      @item.shipping_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day Select')
    end

    it 'shipping_day_idが1では保存できないこと' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day Select')
    end

    it 'priceが空では保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300円未満であれば保存ができないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが9,999,999円を超過すると保存ができないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが半角数字以外では保存できないこと' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end

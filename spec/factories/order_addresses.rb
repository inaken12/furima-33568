FactoryBot.define do
  factory :order_address do
    token {'tok_abcdefghijk00000000000000000'}
    zipcode {'123-4567'}
    state_id { 2 }
    city {'札幌市'}
    address_line_1 {'１−１'}
    address_line_2 {'札幌ビル１０１'}
    phone_number {'09012345678'}
  end
end
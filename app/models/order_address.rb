# class OrderAddress
#   include ActiveModel::Model
#   attr_accessor :postal_code, :shipment_source_id, :municipality, :address, :building_name, :phone_number,

#   with_options presence: true do
#     validates :name
#     validates :name_reading
#     validates :nickname
#   end

#   def save
#     user = User.create(nickname: nickname)

#     Address.create(postal_code: postal_code, shipment_source: shipment_source, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, user_id: user.id)
#     # 寄付金の情報を保存
#     item.create(name: name, price: price, user_id: user.id)
#   end
# end
# end
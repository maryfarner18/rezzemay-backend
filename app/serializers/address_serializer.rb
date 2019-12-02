class AddressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :street1, :street2, :city, :state, :zip, :country
end

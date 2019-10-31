class UserSerializer < ActiveModel::Serializer

  attributes :id, :first_name, :email, :password, :phone, :street, :city, :state, :zipcode


  # t.string "first_name"
  # t.string "last_name"
  # t.string "email"
  # t.string "password_digest"
  # t.string "phone"
  # t.string "street"
  # t.string "city"
  # t.string "state"
  # t.integer "zipcode"
end

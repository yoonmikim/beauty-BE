class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand, :image_link, :price, :product_link
end

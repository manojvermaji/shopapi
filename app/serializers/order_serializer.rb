class OrderSerializer < ActiveModel::Serializer
  attributes :id, :subtotal, :total
  has_many :order_items
  belongs_to :user
end


# "order_items", force: :cascade do |t|
#   t.integer "quantity"
#   t.integer "product_id"
#   t.integer "order_id"
#   t.decimal "total"
#   t.decimal "unit_price"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

# create_table "orders", force: :cascade do |t|
#   t.decimal "subtotal"
#   t.decimal "total"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.integer "user_id", null: false
#   t.index ["user_id
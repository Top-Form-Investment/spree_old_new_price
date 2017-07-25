class SpreePrices < ActiveRecord::Migration
  def change
    add_column :spree_prices, :old_price, :decimal, precision: 10, scale: 2
  end
end

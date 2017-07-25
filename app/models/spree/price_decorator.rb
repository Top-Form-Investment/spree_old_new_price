Spree::Price.class_eval do
  def display_old_price
    Spree::Money.new(old_price || 0, { currency: currency })
  end
end
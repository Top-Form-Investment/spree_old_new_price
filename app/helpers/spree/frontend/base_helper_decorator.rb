Spree::BaseHelper.class_eval do
  def display_old_price(product_or_variant)
    money = product_or_variant.price_in(current_currency).display_old_price
    if money == Spree::Money.new(0, { currency: current_currency} )
      return ""
    else
      money.to_html
    end
  end
  def old_price_save(product_or_variant)
    current_price = product_or_variant.price_in(current_currency).display_price_including_vat_for(current_price_options)
    old_price = product_or_variant.price_in(current_currency).display_old_price
    Spree::Money.new(current_price.money.to_f - old_price.money.to_f  , { currency: current_currency} )
  end
end
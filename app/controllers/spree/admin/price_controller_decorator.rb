Spree::Admin::PricesController.class_eval do
  
  def create
    params[:vp].each do |variant_id, prices|
      variant = Spree::Variant.find(variant_id)
      if variant
        supported_currencies.each do |currency|
          price = variant.price_in(currency.iso_code)
          price.price = (prices[currency.iso_code].blank? ? nil : prices[currency.iso_code])
          price.old_price = (prices[currency.iso_code+"_old"].blank? ? nil : prices[currency.iso_code+"_old"])
          price.save! if price.changed?
        end
      end
    end
    flash[:success] = Spree.t('notice.prices_saved')
    redirect_to admin_product_path(parent)
  end
end

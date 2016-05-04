Spree::Product.class_eval do

  def self.products_in_week
    d = Date.today
    w = d.all_week
    w.map do |date|
      {
        date: date,
        products: self.products_on_date(date)
      }
    end
  end

  def self.products_in_days(date_from, date_to)
    # available_ons = Dish::AvailableOn.where(delivery_date: date_from..date_to)
    # product_ids = available_ons.pluck(:product_id)
    # products = Spree::Product.where(id: product_ids)
    (date_from..date_to).map do |date|
      {
        date: date,
        products: self.products_on_date(date)
      }
    end
  end
  
end

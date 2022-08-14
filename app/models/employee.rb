class Employee < ApplicationRecord
    def deliveries_dided
        {
            name: self.name,
            deliveries: Deliver.where(employee_id: self.id)
        }
    end

    def prepare_filters(filters)
        product_name = filters[:product] if filters.has_key?(:product)
        start_date = filters[:deliveries_between][:start_date] if filters.has_key?(:deliveries_between)
        end_date = filters[:deliveries_between][:end_date] if filters.has_key?(:deliveries_between)

        delivers_by_product = []
        delivers_by_date = []

        delivers_by_product = Product.find_by(name: product_name).delivers.pluck(:id) if filters.has_key?(:product)
        delivers_by_date = Deliver.delivery_date_between(start_date.to_date, end_date.to_date).pluck(:id) if filters.has_key?(:deliveries_between)
        delivers_ids = delivers_by_product.concat(delivers_by_date)
        
        deliveries_of_employee = Deliver.where(id: delivers_ids, employee_id: self.id)

        {
            name: product_name,
            deliveries: deliveries_of_employee
        }
    end
end

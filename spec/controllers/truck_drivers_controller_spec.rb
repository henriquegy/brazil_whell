require "rails_helper"

RSpec.describe TruckDriversController, type: :controller do
  let(:base_route) { 'truck_drivers/' }
  let(:random_employee_id) { Faker::Number.number(digits: 1) }

  # describe "GET show" do
  #   let(:truck_driver) { create(:employee) }

  #   context "when truck driver exists" do
  #     it {
  #       truck_driver
  #       get :show, params: { use_route: base_route, id: truck_driver.id }

  #       expect(response.content_type).to eq('application/json')
  #       expect(JSON.parse(response.body).keys).to match_array(['created_at', 'deleted_at', 'employee_code', 'id', 'name', 'updated_at'])
  #       expect(response).to have_http_status(:ok)
  #     }
  #   end

  #   context "when truck driver do not exists" do
  #     it {
  #       get :show, params: { use_route: base_route, id: random_employee_id }

  #       expect(response.content_type).to eq('application/json')
  #       expect(JSON.parse(response.body).keys).not_to match_array(['created_at', 'deleted_at', 'employee_code', 'id', 'name', 'updated_at'])
  #       expect(response).to have_http_status(202)
  #     }
  #   end
  # end

  # describe "POST create" do
  #   let(:truck_driver) { build(:employee) }

  #   context "when truck driver data is correcly" do
  #     it {
  #       post :create, params: { use_route: base_route, truck_driver: truck_driver.attributes }
  #       expect(response.content_type).to eq('application/json')
  #       expect(JSON.parse(response.body).keys).to match_array(['created_at', 'deleted_at', 'employee_code', 'id', 'name', 'updated_at'])
  #       expect(response).to have_http_status(:ok)
  #     }
  #   end

  #   context "when truck driver data isn't correcly" do
  #     it {
  #       post :create, params: { use_route: base_route, truck_driver: {} }
  #       expect(response.content_type).to eq('application/json')
  #       expect(JSON.parse(response.body).keys).not_to match_array(['created_at', 'deleted_at', 'employee_code', 'id', 'name', 'updated_at'])
  #       expect(response).to have_http_status(400)
  #     }
  #   end
  # end

  # describe "PUT update" do
  #   let(:truck_driver) { create(:employee) }
  #   let(:random_name) { Faker::Name.name }
  #   let(:random_employee_id) { Faker::Internet.base64 }
    
  #   let(:truck_driver_changed) { build(:employee, name: random_name, employee_code: random_employee_id) }

  #   context "when change some fields" do
  #     it {
  #       truck_driver
  #       post :create, params: { use_route: base_route, truck_driver: truck_driver_changed.attributes, id: truck_driver.id }
  #       expect(response.content_type).to eq('application/json')
  #       expect(JSON.parse(response.body).keys).to match_array(['created_at', 'deleted_at', 'employee_code', 'id', 'name', 'updated_at'])
  #       expect(JSON.parse(response.body).symbolize_keys[:name]).to be = truck_driver_changed.name
  #       expect(JSON.parse(response.body).symbolize_keys[:employee_code]).to be = truck_driver_changed.employee_code
  #       expect(response).to have_http_status(:ok)
  #     }
  #   end
  # end

  # describe "DELETE destroy" do
  #   context "when deleted one truck driver" do
  #     let(:truck_driver) { create(:employee) }

  #     it {
  #       delete :destroy, params: { use_route: base_route, id: truck_driver.id }
  #       expect(response.content_type).to eq('application/json')
  #       expect(JSON.parse(response.body).keys).to match_array(['created_at', 'deleted_at', 'employee_code', 'id', 'name', 'updated_at'])
  #       expect(response).to have_http_status(:ok)
  #     }
  #   end
  # end

  describe "GET filter deliveries of one truck driver" do
    let(:truck_driver_one) { create(:employee) }
    let(:truck_driver_two) { create(:employee) }
    let(:product) { build(:product) }
    let(:deliver) { build(:deliver) }
    let(:range_date) { Faker::Date.between(from: '2022-01-01', to: '2022-12-30') }

    before do
      truck_driver_one
      deliver_hash = deliver.attributes.symbolize_keys
      deliver_hash.merge!({ employee_id: truck_driver_one.id })
      deliver_hash.merge!({ deliver_has_products_attributes: [product_attributes: product.attributes] })

      Deliver.create(deliver_hash)

      truck_driver_two
      deliver_hash = deliver.attributes.symbolize_keys
      deliver_hash.merge!({ employee_id: truck_driver_two.id })
      deliver_hash.merge!({ deliver_has_products_attributes: [product_attributes: product.attributes] })

      Deliver.create(deliver_hash)
    end

    context "when send full filters" do      
      let(:full_filters) {
        "
          {
            product: \"#{product.name}\",
            deliveries_between: {
              start_date: \"#{range_date}\",
              end_date: \"#{range_date}\"
            }
          }
        "
      }

      it {
        get :deliveries_by_fiter, params: { use_route: base_route, filters: full_filters, id: truck_driver_one.id }
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body).keys).to match_array(["deliveries", "name"])
        expect(response).to have_http_status(:ok)
      }
    end

    context "when the filters is {}" do
      it {
        get :deliveries_by_fiter, params: { use_route: base_route, filters: {}, id: truck_driver_one.id }
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body).keys).to match_array(["deliveries", "name"])
        expect(response).to have_http_status(:ok)
      }
    end

    context "when send only product name" do
      let(:only_product_filters) {
        "
          {
            product: \"#{product.name}\"
          }
        "
      }

      it {
        get :deliveries_by_fiter, params: { use_route: base_route, filters: only_product_filters, id: truck_driver_one.id }
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body).keys).to match_array(["deliveries", "name"])
        expect(response).to have_http_status(:ok)
      }
    end

    context "when send only deliveries_between" do
      let(:only_deliveries_between_filters) {
        "
          {
            deliveries_between: {
              start_date: \"#{range_date}\",
              end_date: \"#{range_date}\"
            }
          }
        "
      }

      it {
        get :deliveries_by_fiter, params: { use_route: base_route, filters: only_deliveries_between_filters, id: truck_driver_one.id }
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body).keys).to match_array(["deliveries", "name"])
        expect(response).to have_http_status(:ok)
      }
    end
  end
end
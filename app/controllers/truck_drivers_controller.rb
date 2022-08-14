class TruckDriversController < ApplicationController
    before_action :force_json_format
    before_action :find_truck_driver, only: %w[show update destroy deliveries_by_fiter]

    def show
        render json: @truck_driver
    end

    def deliveries_by_fiter
        begin
            deliveries = @truck_driver.deliveries_dided unless params.has_key?('filters')
            deliveries = @truck_driver.prepare_filters(eval(params['filters'])) if params.has_key?('filters')
            render json: deliveries
        rescue StandardError => e
            render json: { error: e.message }, status: 400
        end
    end
    
    def create
        begin
            truck_driver = Employee.create(permit_truck_driver)
            render json: truck_driver
        rescue StandardError => e
            render json: { error: e.message }, status: 400
        end
    end
    
    def update
        begin
            truck_driver.update(permit_truck_driver)
            render json: truck_driver
        rescue StandardError => e
            render json: { error: e.message }, status: 400
        end
    end
    
    def destroy
        begin
            @truck_driver.destroy
            render json: @truck_driver
        rescue StandardError => e
            render json: { error: e.message }, status: 400
        end
    end

    protected

    def permit_truck_driver
        params.fetch(:truck_driver).permit(:id, :name, :employee_code)
    end

    def force_json_format
        request.format = :json
    end

    def find_truck_driver
        begin
            @truck_driver = Employee.find(params[:id])
        rescue StandardError => e
            render json: { error: e.message }, status: 202
        end
    end
end

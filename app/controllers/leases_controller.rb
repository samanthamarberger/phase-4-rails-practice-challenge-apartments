class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        leases = Lease.all
        render json: leases, status: :ok
    end

    def create
        lease = Lease.create(lease_params)
        render json: lease
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end


    private

    def lease_params
        params.permit(:rent)
    end

    def render_not_found_response
      render json: { error: "Lease not found" }, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end

class Api::V1::ConsultationRequestsController < ApplicationController

	# GET /api/v1/consultation_requests
	def index
		@consultation_requests = ConsultationRequest.all
		render json: @consultation_requests, status: :ok
	end    

	# GET /api/v1/consultation_requests/:id
	def show
		begin
			@consultation_request = ConsultationRequest.find(params[:id])
			render json: @consultation_request, status: :ok
		rescue ActiveRecord::RecordNotFound
			error_message = { error: "consultation_request not found" }
			render json: error_message, status: :not_found
		end	
	end    

	# POST /api/v1/consultation_requests
	def create
		if any_field_present?(consultation_request_params)
			@consultation_request = ConsultationRequest.new(consultation_request_params)
			if @consultation_request.save
				render json: @consultation_request, status: :created
			else
				error_message = { error: "unable to create consultation_request" }
				render json: error_message, status: :bad_request
			end
		else 
			error_message = { error: "validation failed" }
			render json: error_message, status: :bad_request
		end
	end    

	# POST /api/v1/consultation_requests/:id/recommendations
	def recommendations
		@data = MedicineApi.init

		request_id = params[:id]
		@recommendation = Recommendation.new(
			consultation_request_id: request_id, 
			content: @data
		)
		
		if @recommendation.save
			render json: @recommendation, status: :created
		else
			error_message = { error: "unable to create recommendation" }
			render json: error_message, status: :bad_request
		end
	end

	private 

	def consultation_request_params
		params.require(:consultation_request).permit(:patient_id, :content)
	end

	def recommendation_params
		params.permit(:consultation_request_id, :content)
	end

	def any_field_present?(params)
		params.values.any?(&:present?)
	end

end

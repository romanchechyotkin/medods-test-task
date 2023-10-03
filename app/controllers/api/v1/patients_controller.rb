class Api::V1::PatientsController < ApplicationController
	
	# GET /patients
	def index
			@patients = Patient.all
			render json: @patients
	end    
	
		# GET /patients/:id
	def show
		begin
			@patient = Patient.find(params[:id])
			render json: @patient, status: :created
		rescue ActiveRecord::RecordNotFound
			# Handle the case where the record is not found
			error_message = { error: "patient not found" }
			render json: error_message, status: :not_found
		end	
	end    

	def create
		if any_field_present?(patient_params)
			@patient = Patient.new(patient_params)
			if @patient.save
				render json: @patient, status: :created
			else
				error_message = { error: "unable to create patient" }
				render json: error_message, status: :bad_request
			end
		else 
			error_message = { error: "validation failed" }
			render json: error_message, status: :bad_request
		end
	end

	private 

	def patient_params
		params.require(:patient).permit(:first_name, :middle_name, :last_name, :email, :birth_date, :telephone_number)
	end
	
	def any_field_present?(params)
    params.values.any?(&:present?)
  end

end

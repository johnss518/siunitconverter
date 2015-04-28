class Api::V1::UnitsController < ApplicationController
	include Converter
	rescue_from ActiveRecord::RecordNotFound, :with => :handle_not_found_parameter
	rescue_from ActionController::ParameterMissing, :with => :handle_missing_parameters	
	rescue_from Apipie::ParamMissing, :with => :handle_missing_parameters	

	resource_description do 
		short "Convert unit to SI unit"
		formats ['json']
		api_version 'v1'
		error code: 400, desc: 'Required parameter missing'
		error code: 404, desc: 'Unit not found'
	end
	
	api!
	description "This call returns the converted unit as well as an output value representing any scalar or vector calculations"
	formats ['json']
	param :name, String, desc: 'input unit to convert', required: true
	param :input_value, String, desc: 'optional comma separated scalar value(s). Example: 1,2,3', required: false

	def show
		if params.has_key?(:name) 
			if (params.has_key?(:input_value))
				vector = params[:input_value].split(',')
			end
			render json: do_conversion(params[:name], vector), status: :ok
		else 
			raise ActionController::ParameterMissing
		end 	
	end

	protected
		def handle_missing_parameters(e)
			render json: {errors: 'Required parameter missing'}, status: :bad_request 
		end

		def handle_not_found_parameter(e)
			render json: {errors: 'Unit not found'}, status: :not_found
		end

		def unit_parameters
			params.require(:unit_name, :symbol, :multiplication_factor, :si_unit)
		end
end

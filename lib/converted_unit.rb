class ConvertedUnit
	require 'uri'

	attr_accessor :unit_name, :multiplication_factor, :linear_shift, :output_value

	def initialize(unit_name, multiplication_factor = 1, simple_unit = true, linear_shift = 0.0, output_value = nil)
		if simple_unit
			si_unit = Unit.find_by(unit_name: unit_name.strip.downcase)
			if !si_unit
				si_unit = Unit.find_by!(symbol: URI.unescape(unit_name).strip.downcase)
			end
		end
		@unit_name = simple_unit ? si_unit[:si_unit] : unit_name
		@multiplication_factor = simple_unit ? si_unit[:multiplication_factor] : multiplication_factor
		@linear_shift = linear_shift
		@output_value = output_value
	end
	
	def *(other)
		if other.is_a?(ConvertedUnit) 
			ConvertedUnit.new(@unit_name+'*'+other.unit_name, @multiplication_factor*other.multiplication_factor,false)
		end
	end

	def /(other)
		if other.is_a?(ConvertedUnit) 
			ConvertedUnit.new(@unit_name+'/'+other.unit_name, @multiplication_factor/other.multiplication_factor,false)
		end
	end
	
	def scale(vector)
		unless vector.nil?
			result = [];
			vector.each do |vector_amount|
				begin 
					vector_amount = Float(vector_amount)
					result << vector_amount * @multiplication_factor
				rescue 
					result << 0.0
				end
			end
			@output_value = result
		end

		print
	end 

	private 
	def print
		output = {:unit_name => @unit_name, :multiplication_factor => @multiplication_factor, 
				:linear_shift => @linear_shift}
		unless @output_value.nil?
			output.merge!({ :output_value => @output_value})
		end
		output
  	end
end

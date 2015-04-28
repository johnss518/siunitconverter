module Converter
	def do_conversion(name, vector = [])
		if name.include? '/'
			arr = name.split('/', 2)
			unit1 = ConvertedUnit.new(arr[0])
			unit2 = ConvertedUnit.new(arr[1])
			return (unit1/unit2).scale(vector)
		elsif name.include? '*'
			arr = name.split('*', 2)
			unit1 = ConvertedUnit.new(arr[0])
			unit2 = ConvertedUnit.new(arr[1])
			return (unit1*unit2).scale(vector)
		else
			return ConvertedUnit.new(name).scale(vector)
		end
	end
end
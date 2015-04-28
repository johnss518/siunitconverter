Apipie.configure do |config|
  config.app_name                = "Siunitconverter"
  config.api_base_url            = "/apipie"
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.default_version         = "v1"
  config.app_info = "
    The input to the API must include a string with unit name. The output contains 3 values: The correct SI unit name, a multiplication factor, and a linear shift factor. The units might be solo, divided, or multiplied together, eg \"hectare\", \"degrees/min\", or \"L*hour\". You can assume the string 'minute' refers to time. Here is an example input and output:
Input: \"degrees/minute\"  -> 
    { unit_name: \"rad/s\", multiplication_factor: \"0.00029088820867\", linear_shift:  \"0.00\" }

It can also take an optional value, as a scalar or vector. If this value is supplied, it will simply perform the calculation for the value (or all the values) and also return that in the body of the response. 

Input: { name: \"minute\", input_value: [1,2] } -> 
    { 
    \"unit_name\" => \"s\",
    \"multiplication_factor\" => 60.0,
    \"linear_shift\" => 0.0,
    \"output_value\" => [
        [0] 60.0,
        [1] 120.0
    ]}
"
end

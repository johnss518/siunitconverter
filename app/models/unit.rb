class Unit < ActiveRecord::Base
	validates_presence_of :unit_name, :symbol, :multiplication_factor
	validates_uniqueness_of :unit_name, scope: [:symbol]
end
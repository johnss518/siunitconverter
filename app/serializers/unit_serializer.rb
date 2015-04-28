class UnitSerializer < ActiveModel::Serializer
	attributes :id, :unit_name, :symbol, :multiplication_factor, :si_unit
end
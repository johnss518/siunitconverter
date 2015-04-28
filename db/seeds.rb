# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Unit.create!(
  [ { unit_name: 'minute', symbol: 'min', multiplication_factor: 60, si_unit: 's' },
    { unit_name: 'hour', symbol: 'h', multiplication_factor: 3600, si_unit: 's' },
    { unit_name: 'day', symbol: 'd', multiplication_factor: 86400, si_unit: 's' },
    { unit_name: 'degree', symbol: "°", multiplication_factor: (Math::PI/180), si_unit: 'rad'},
    { unit_name: 'second', symbol: "''", multiplication_factor: (Math::PI/648000), si_unit: 'rad'},
    { unit_name: 'hectare', symbol: 'ha', multiplication_factor: 10000, si_unit: 'm2' },
    { unit_name: 'litre', symbol: 'l', multiplication_factor: 0.001, si_unit: 'm3' },
    { unit_name: 'tonne', symbol: 't', multiplication_factor: 1000000, si_unit: 'g' }, 
    { unit_name: 'second', symbol: 's', multiplication_factor: 1, si_unit: 's'}, 
    { unit_name: 'radian', symbol: 'rad', multiplication_factor: 1, si_unit: 'rad'},
    { unit_name: 'meter', symbol: 'm', multiplication_factor: 1, si_unit: 'm'},
	{ unit_name: 'gram', symbol: 'g', multiplication_factor: 1, si_unit: 'g'},
    { unit_name: 'neper', symbol: 'np', multiplication_factor: Math.exp(1), si_unit: ''},
    { unit_name: 'bel', symbol: 'b', multiplication_factor: (Math.log(10)/2)*Math.exp(1), si_unit: ''},
    { unit_name: 'decibel', symbol: 'db', multiplication_factor: 0.1*(Math.log(10)/2)*Math.exp(1), si_unit: ''}
  ])
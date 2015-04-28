class CreateUnits < ActiveRecord::Migration
  def change
    create_table "units", force: true do |t|
	    t.string   "unit_name"
	    t.string   "symbol"
	    t.float    "multiplication_factor"
	    t.string   "si_unit"
	    t.datetime "created_at"
	    t.datetime "updated_at"
    end
  end
end

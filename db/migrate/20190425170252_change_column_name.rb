class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :doctor_specialities, :speciality_id, :specialty_id
  end
end

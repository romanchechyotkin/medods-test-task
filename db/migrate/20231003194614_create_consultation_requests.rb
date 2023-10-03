class CreateConsultationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :consultation_requests do |t|
      t.integer :patient_id
      t.text :content

      t.timestamps
    end
  end
end

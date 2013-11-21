class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
		t.string :name
		t.text :about  
		t.string :category
		t.has_attached_file :avatar
		t.has_attached_file :background

		t.timestamps  
    end
  end
end

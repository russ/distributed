ActiveRecord::Schema.define(:version => 0) do
	create_table :users, :force => true do |t|
		t.column :name, :string, :limit => 255
		t.column :state, :string, :limit => 255
		t.column :is_admin, :boolean, :default => false
		t.column :created_at, :datetimte
		t.column :updated_at, :datetimte
	end
end

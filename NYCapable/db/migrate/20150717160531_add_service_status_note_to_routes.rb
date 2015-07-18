class AddServiceStatusNoteToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :service_status_note, :string, default: ''
  end
end

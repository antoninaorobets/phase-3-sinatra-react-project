class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :code
      t.string :location
      t.string :logo
      t.string :description
    end
  end
end

class AddColumsToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :url, :string
    add_column :jobs, :company_link, :string
  end
end

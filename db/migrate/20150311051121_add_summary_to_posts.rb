class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :summary_body, :string
  end
end

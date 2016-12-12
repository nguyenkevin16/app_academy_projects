class FixColumnNameInContactShares2 < ActiveRecord::Migration
  def change
    rename_column :contact_shares, :to_share_with_id, :share_with_id
  end
end

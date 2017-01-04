class FixColumnNameInContactShares < ActiveRecord::Migration
  def change
    rename_column :contact_shares, :user_id, :to_share_with_id
  end
end

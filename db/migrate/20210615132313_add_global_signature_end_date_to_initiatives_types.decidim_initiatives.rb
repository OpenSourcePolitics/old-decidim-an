# frozen_string_literal: true
# This migration comes from decidim_initiatives (originally 20210517150011)

class AddGlobalSignatureEndDateToInitiativesTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :global_signature_end_date, :date, null: true, default: nil
  end
end

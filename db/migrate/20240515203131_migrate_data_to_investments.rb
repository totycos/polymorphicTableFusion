class MigrateDataToInvestments < ActiveRecord::Migration[7.0]
  def up
    ActiveRecord::Base.transaction do # transaction -> toutes les données sont correctement copiées sinon aucune
      begin
        UserProduct.find_each do |user_product|
          Investment.create!(
            investor_id: user_product.user_id,
            investor_type: 'User',
            product_id: user_product.product_id,
            category_id: user_product.category_id,
            balance: user_product.balance,
            status: user_product.status,
            transaction_type: user_product.transaction_type,
            created_at: user_product.created_at,
            updated_at: user_product.updated_at
          )
        end

        CompanyProduct.find_each do |company_product|
          Investment.create!(
            investor_id: company_product.company_id,
            investor_type: 'Company',
            product_id: company_product.product_id,
            category_id: company_product.category_id,
            balance: company_product.balance,
            status: company_product.status,
            transaction_type: company_product.transaction_type,
            created_at: company_product.created_at,
            updated_at: company_product.updated_at
          )
        end
      rescue StandardError => e
        puts "An error occurred during migration: #{e.message}"
        raise ActiveRecord::Rollback, "Migration failed: #{e.message}"
      end
    end
  end

  def down
    Investment.delete_all
  end
end

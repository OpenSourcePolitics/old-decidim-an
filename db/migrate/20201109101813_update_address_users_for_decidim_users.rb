class UpdateAddressUsersForDecidimUsers < ActiveRecord::Migration[5.2]
  def up
    Decidim::User.where.not(full_address: nil, address: {}).find_each do |user|
      user.update(full_address: user.computed_full_address(user.address))
    end
  end
end

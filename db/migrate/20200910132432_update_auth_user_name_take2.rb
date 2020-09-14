class UpdateAuthUserNameTake2 < ActiveRecord::Migration[5.2]
  def change
    Decidim::Authorization.where(name: 'france_connect_profile').each do |auth|
      auth.user.update_columns(name: "#{auth.metadata[:first_name]&.split(' ')&.first} #{auth.metadata[:last_name]}")
    end
  end
end

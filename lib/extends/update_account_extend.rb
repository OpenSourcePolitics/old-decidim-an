# frozen_string_literal: true
require "active_support/concern"

module UpdateAccountExtend
  extend ActiveSupport::Concern

  included do

    private

    def update_personal_data
      @user.email = @form.email
      @user.address = @form.address
      @user.full_address = computed_full_address
      @user.custom_agreement_at = DateTime.now if @form.custom_agreement
      @user.email_on_notification = @form.email_on_notification
    end

    def computed_full_address
      "#{@form.number_and_street}, #{@form.city} #{@form.postal_code}, #{@form.country}"
    end
  end
end

Decidim::UpdateAccount.send(:include, UpdateAccountExtend)

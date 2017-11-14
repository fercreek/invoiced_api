# frozen_string_literal: true

module V1
  class OrganizationsController < ApplicationController
    include V1::Contacts::Response

    def create
      organization = current_account.organizations.build(organizations_params)

      if organization.save
        render :create, locals: { organization: organization},
               status: :created
      else
        render json: { errors: organization.errors.messages }, 
               status: :unprocessable_entity
      end
    end

    private

    def organizations_params
      params.require(:organization)
        .permit(
          :name, :address,:tax_payer_number
        )
    end
  end
end

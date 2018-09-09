class Trades::ContractsController < ApplicationController
  def new
  end

  def create
    render :new and return unless Contract.create(contract_params)

    redirect_to user_skills_path(current_user)
  end

  private

  def contract_params
    params.permit(
      :requested_order_id,
      :responded_order_id
    )
  end
end

class Trades::OrdersController < ApplicationController
  def new
    @requested_order = current_user.requested_orders.find(params[:requested_order_id])
    @responded_order = current_user.requesting_orders.new
    taker_id = @requested_order.user_id
    @skills = User.find(taker_id).skills
  end

  def create
    requested_order = current_user.requested_orders.find(params[:requested_order_id])
    taker_id = requested_order.user_id
    @skills = User.find(taker_id).skills
    @responded_order = current_user.requesting_orders.new(order_params)

    ActiveRecord::Base.transaction do
      @responded_order.save!
      # TODO: 約定したら注文を受けている一覧からトレードできなくする
      Contract.create!(
        requested_order_id: requested_order.id, 
        responded_order_id: @responded_order.id,
      )
    end

    flash[:notice] = "トレードが成立しました！"
    redirect_to user_path(current_user)
  rescue
    render :new
  end

  private

  def order_params
    params.permit(
      :skill_id,
    )
  end
end

class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_records

  def index
    @record_address = RecordAddress.new
    if current_user == @item.user
      redirect_to root_path
    elsif @item.record.present?
      redirect_to root_path
    end
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_records
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end
end

class Customer::CardsController < Customer::ApplicationController
  def index
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
    default_card_id = customer.default_card
    @card_in_use = customer.cards.retrieve(default_card_id)
    @cards_registered = customer.cards['data'].filter { |card| card['id'] != default_card_id }.map(&:itself)
  end

  def create
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
    @new_card = customer.cards.create(card: card_params[:card_token])
  end

  private

  def card_params
    params.require(:card).permit(:card_token)
  end
end
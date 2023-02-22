class Customer::CardsController < Customer::ApplicationController
  def show
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    if current_customer.payjp_customer.present?
      customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
      default_card_id = customer.default_card
      @card_in_use = customer.cards.retrieve(default_card_id)
      @cards_registered = customer.cards['data'].filter { |card| card['id'] != default_card_id }.map(&:itself)
    end
  end

  def create
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    ActiveRecord::Base.transaction do
      if current_customer.payjp_customer.blank?
        payjp_customer = Payjp::Customer.create(
          card: card_params[:card_token],
          email: current_customer.email,
          description: current_customer.full_name
        )

        current_customer.create_payjp_customer!(uid: payjp_customer.id)
        @new_card = payjp_customer.cards.retrieve(payjp_customer.default_card)
        @in_use = true
      else
        customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
        @new_card = customer.cards.create(card: card_params[:card_token])
        @in_use = false
      end
    end
  end

  def update
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
    customer.default_card = card_params[:id]
    customer.save
    @cards_registered = customer.cards['data'].filter { |card| card['id'] != card_params[:id] }.map(&:itself)
  end

  def destroy
    Payjp.api_key = ENV['PAYJP_API_TOKEN']
    customer = Payjp::Customer.retrieve(current_customer.payjp_customer.uid)
    card = customer.cards.retrieve(card_params[:id])
    card.delete
  end

  private

  def card_params
    params.require(:card).permit(:card_token, :id)
  end
end
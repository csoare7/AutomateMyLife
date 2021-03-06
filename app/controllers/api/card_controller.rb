module Api
  class CardController < BaseController
    def create
      @card = Card.create card_params
      respond_to do |format|
        format.json { render json: @card }
      end
    end

    private

    def card_params
      params
        .require(:card)
        .permit(:text)
        .merge(user_id: current_user.id)
    end
  end
end

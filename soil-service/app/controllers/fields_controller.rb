class FieldsController < ActionController::Base

  def index
    render json: helpers.humus_balance_calculator(FieldsService.instance.fetch_fields)
  end

end

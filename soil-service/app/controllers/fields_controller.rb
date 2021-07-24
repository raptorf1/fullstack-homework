class FieldsController < ActionController::Base
  def index
    all_fields = FieldsService.instance.fetch_fields
    all_fields.each do |field|
      field_deltas = []
      field[:crops].each do |crop|
        field_deltas.push(crop[:crop][:humus_delta])
      end
      field.store(:humus_balance, field_deltas.sum)
    end
    render json: all_fields
  end
end

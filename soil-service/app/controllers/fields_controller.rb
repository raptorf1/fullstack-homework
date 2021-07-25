class FieldsController < ActionController::Base

  def index
    if params.has_key?('fieldId')
      current_fields_symbolized = []
      JSON.parse(params['currentFields']).each do |field|
        field['oldbalance'] = field.delete('balance')
        field['crops'].sort_by! { |k| k['year']}
        current_fields_symbolized.push(field.deep_symbolize_keys)
      end
      field_to_change = current_fields_symbolized.find{ |item| item[:id] == params['fieldId'].to_i }
      new_crop = CropsService.instance.fetch_all_crops.find{ |item| item[:value] == params['newCrop'].to_i }
      field_to_change[:crops].each do |crop|
        if crop[:year] == params['year'].to_i
          crop.delete(:crop)
          crop[:crop] = new_crop
        end
      end
      render json: helpers.humus_balance_calculator(current_fields_symbolized)
    else
      render json: helpers.humus_balance_calculator(FieldsService.instance.fetch_fields)
    end
  end

end

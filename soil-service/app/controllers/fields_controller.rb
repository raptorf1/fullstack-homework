class FieldsController < ActionController::Base

  def index
    if params.has_key?('fieldId')
      current_fields_parsed = JSON.parse(params['currentFields'])
      current_fields_symbolized = []
      current_fields_parsed.each do |field|
        field.delete('balance')
        field['crops'].sort_by! { |k| k['year']}
        current_fields_symbolized.push(field.deep_symbolize_keys)
      end
      original_fields = current_fields_symbolized
      field_to_change = original_fields.find{ |item| item[:id] == params['fieldId'].to_i }
      new_crop = CropsService.instance.fetch_all_crops.find{ |item| item[:value] == params['newCrop'].to_i }
      field_to_change[:crops].each do |crop|
        if crop[:year] == params['year'].to_i
          crop.delete(:crop)
          crop[:crop] = new_crop
        end
      end
      render json: helpers.humus_balance_calculator(original_fields)
    else
      render json: helpers.humus_balance_calculator(FieldsService.instance.fetch_fields)
    end
  end

end

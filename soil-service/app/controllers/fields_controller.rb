class FieldsController < ActionController::Base

  def index
    if params.has_key?('fieldId')
      original_fields = FieldsService.instance.fetch_fields
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

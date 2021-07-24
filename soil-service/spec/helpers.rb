module Helpers

  def humus_balance_calculator(fields)
    fields.each do |field|
      field_deltas = []
      crop_value = 0
      field[:crops].each do |crop|
        crop[:crop][:value] === crop_value ? field_deltas.push(crop[:crop][:humus_delta] * 1.3) : field_deltas.push(crop[:crop][:humus_delta])
        crop_value = crop[:crop][:value]
      end
      field.store(:balance, field_deltas.sum)
    end
    return fields
  end

end
class FieldsController < ActionController::Base
  def index
    all_fields = FieldsService.instance.fetch_fields
    all_fields.each do |field|
      binding.pry
    end
    render json: FieldsService.instance.fetch_fields
  end
end

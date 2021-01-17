class ApplicationController < ActionController::API
  rescue_from 'ActiveRecord::RecordNotFound' do |e|
    render status: 404, json: { error: "#{e.model} not found" }
  end

  rescue_from 'ActiveRecord::RecordInvalid' do |e|
    error_messsages = e.record.errors.map do |validation_error|
      field = validation_error.attribute.to_s

      validation_error.message.sub(field, field.camelize(:lower))
    end

    render status: 400, json: { error: "#{e.record.model_name.name}: #{error_messsages.join(',')}" }
  end

  rescue_from 'Exceptions::ApiError' do |e|
    render status: e.status, json: { error: e.message }
  end
end

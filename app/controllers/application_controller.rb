class ApplicationController < ActionController::API
  rescue_from 'ActiveRecord::RecordNotFound' do |e|
    render status: 404, json: { error: "#{e.model} not found" }
  end

  rescue_from 'ActiveRecord::RecordInvalid' do |e|
    render status: 400, json: { error: "#{e.record.model_name.name}: #{e.record.errors.map { |e| e.message }.join(',')}" }
  end

  rescue_from 'Exceptions::ApiError' do |e|
    byebug
    render status: e.status, json: { error: e.message }
  end
end

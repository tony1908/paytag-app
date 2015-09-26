class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    respond_to :json
   rescue_from(ActiveRecord::RecordInvalid) do |invalid| #Cachar los errores de active admin y enviarlos 
   response = {status: 'error', fields: invalid.record.errors}
   render json: response, status: :unprocesaable_entity
   end
   rescue_from(ActiveRecord::RecordNotFound) do |invalid|
   response = {status: 'error', fields: 'registro no encontrado'}
   render json: response, status: :unprocesaable_entity
   end
  
end

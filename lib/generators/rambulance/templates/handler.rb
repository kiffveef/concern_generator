class ExceptionsApp < Rambulance::ExceptionsApp
  %i[
    not_found
    conflict
    unprocessable_entity
    method_not_allowed
    not_implemented
    bad_request
    internal_server_error
    unauthorized
  ].each do |name|
    define_method name do
      render json: message(name)
    end
  end

  private
    def message(method)
      {
        error: method.to_s.humanize,
      }.tap do |element|
        element[:request] =
          %(#{request&.env&.[]("REQUEST_METHOD")} #{request&.env&.[]("REQUEST_URI")})
      end if defined?(request)
    end
end

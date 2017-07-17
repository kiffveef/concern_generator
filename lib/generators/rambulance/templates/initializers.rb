Rambulance.setup do |config|

  # @see http://www.rubydoc.info/gems/actionpack-rack-upgrade/ActionController/Rescue
  config.rescue_responses = {
    "ActionController::RoutingError"             => :not_found,
    "ActionController::UnknownAction"            => :not_found,
    "ActiveRecord::RecordNotFound"               => :not_found,
    "ActiveRecord::StaleObjectError"             => :conflict,
    "ActiveRecord::RecordInvalid"                => :unprocessable_entity,
    "ActiveRecord::RecordNotSaved"               => :unprocessable_entity,
    "ActiveRecord::RecordNotUnique"              => :conflict,
    "ActionController::MethodNotAllowed"         => :method_not_allowed,
    "ActionController::NotImplemented"           => :not_implemented,
    "ActionController::InvalidAuthenticityToken" => :unprocessable_entity,
    "AttrExtras::MethodNotImplementedError"      => :internal_server_error,
  }

  config.layout_name = nil
  config.view_path = nil
end

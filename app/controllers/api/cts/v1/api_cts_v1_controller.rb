class Api::Cts::V1::ApiCtsV1Controller < ApplicationController
  log_request scope: 'cts:v1'

  protected
  def current_ability
    @_current_ability ||= Cts::Ability.new
  end
end

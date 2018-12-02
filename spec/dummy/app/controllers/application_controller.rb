class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include OpinionatedPundit::Controllers::AuthorizationManager
  rescue_from OpinionatedPundit::Controllers::PermissionManager::PermissionNotGranted, with: :unauthorized_handler

  private

  def unauthorized_handler
    msg = 'Ooops! It seems that you are not authorized to do that!'
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, alert: msg }
      format.js{ render(js: "alert('#{msg}');") }
    end
  end

end

class AbstractAppController < ApplicationController
  before_filter :authenticate_container_user!
  helper_method :current_user

  # TODO: authenticate
  def authenticate_container_user!
    if session[:current_container_user_id]
      container_user_id = session[:current_container_user_id]
    else
      raise "params[:opensocial_owner_id] is required" unless params[:opensocial_owner_id]
      container_user_id = params[:opensocial_owner_id]
    end
    @current_container_user = User.find_by_container_user_id!(container_user_id)
    start_session
  end
  attr_reader :current_container_user
  alias :current_user :current_container_user

  def start_session
    session[:current_container_user_id] = current_user.container_user_id
  end
end


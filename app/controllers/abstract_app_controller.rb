class AbstractAppController < ApplicationController
  before_filter :authenticate_container_user!
  helper_method :current_user

  # TODO: authenticate
  def authenticate_container_user!
    raise "params[:opensocial_owner_id] is required" unless params[:opensocial_owner_id]
    @current_container_user = User.find_by_container_user_id!(params[:opensocial_owner_id])
  end
  attr_reader :current_container_user
  alias :current_user :current_container_user
end


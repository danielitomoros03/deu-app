class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  private
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
end

class DashboardController < ApplicationController

  def index
  end

  private
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
end

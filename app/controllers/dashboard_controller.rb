class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @accessible_pages = Page.accessible_by(current_ability)
    @accessible_users  = User.accessible_by(current_ability)

    @page_count        = @accessible_pages.count
    @page_this_month   = @accessible_pages.where("created_at >= ?", Time.current.beginning_of_month).count
    @event_count       = Event.count
    @event_this_month  = Event.where("created_at >= ?", Time.current.beginning_of_month).count
    @user_count        = @accessible_users.count
  end
end

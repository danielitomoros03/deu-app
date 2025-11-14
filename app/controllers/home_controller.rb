class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @pages_all = Page.all
    @first_page = Page.first
  end
end

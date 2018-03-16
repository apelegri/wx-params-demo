class HomeController < ApplicationController
  before_action :authenticate, except: [:index]
  wechat_api

  def index
  end

  def page
  end

  private

  def authenticate
    unless user_signed_in?
      redirect_to user_wechat_omniauth_authorize_path(param: 'test')
    end
  end
end

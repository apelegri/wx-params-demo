class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def wechat
    param = params[:param]
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user
    redirect_to page_path(param: param )
  end
end

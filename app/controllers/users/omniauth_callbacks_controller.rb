class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def wechat
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user
    redirect_to root_path(@user, param: 'TEST')
  end
end

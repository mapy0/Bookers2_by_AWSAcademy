class ApplicationController < ActionController::Base
  
  #devise利用の機能（ユーザ登録、ログイン認証等）使用前にconfigure_permitted_parameters実行。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #nameのデータ操作を許可するアクションメソッドが指定
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作許可。
  end
end
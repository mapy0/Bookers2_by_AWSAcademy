class ApplicationController < ActionController::Base
  
  #devise利用の機能（ユーザ登録、ログイン認証等）使用前にconfigure_permitted_parameters実行。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #ログイン後は投稿一覧画面に遷移
  def after_sign_in_path_for(resource)
    books_path
  end

  protected

  def configure_permitted_parameters
    #nameのデータ操作を許可するアクションメソッドが指定
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作許可。
  end
end
class UsersController < ApplicationController
  
  #User詳細表示画面作成
  def show
    @user = User.find(params[:id])
    @users = current_user #User部分テンプレート
    @new_book = Book.new #Book投稿部分テンプレート

  end
  
  #投稿リストを表示画面作成
  def edit
   @user = User.find(params[:id])
  end
  
  #編集データの保存機能
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  #User一覧表示
  def index
    @users = User.all
    @user = current_user #User情報部分テンプレート
    @new_book = Book.new #Book投稿部分テンプレート
  end
  
end

private

def user_params
  params.require(:user).permit(:name, :profile_image)
end
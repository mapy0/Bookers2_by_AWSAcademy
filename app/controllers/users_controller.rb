class UsersController < ApplicationController
  
  #User詳細表示画面作成
  def show
    @user = User.find(params[:id])
    @books = @user.books
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
end

#
private

def user_params
  params.require(:user).permit(:name, :profile_image)
end
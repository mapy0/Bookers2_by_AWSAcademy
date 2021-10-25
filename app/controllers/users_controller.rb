class UsersController < ApplicationController
 before_action :correct_user,   only: [:edit, :update]  

  #User詳細表示画面作成
  def show
    @user = User.find(params[:id])
    @users = current_user #User部分テンプレート
    @new_book = Book.new #Book投稿部分テンプレート
    @books = Book.where(user_id: @user.id)
  end
  
  #投稿リストを表示画面作成
  def edit
    #@user = User.find(params[:id])
    # unless current_user == @user
    # redirect_to user_path(current_user.id)
    # end
    if @user == current_user
    render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  #編集データの保存機能
  def update
    @user = User.find(params[:id])
   if  @user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to user_path(@user.id)
   else
     render "edit"
   end
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
  params.require(:user).permit(:name, :profile_image, :introduction)
end

def correct_user
  @user = User.find(params[:id])
end
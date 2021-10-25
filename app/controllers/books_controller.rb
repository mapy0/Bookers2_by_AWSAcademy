class BooksController < ApplicationController
before_action :correct_user,   only: [:edit, :delete]


 #投稿内容保存
 def create
 @new_book = Book.new(book_params)
 @new_book.user_id = current_user.id
 #falseならば、showページを再表示
  if @new_book.save
    flash[:notice]="You have creatad book successfully."
   redirect_to book_path(@new_book.id)
  else
   @user = current_user #user情報の部分テンプレート
   @books = Book.all
   render :index
  end
 end

 #投稿リストを表示画面作成
 def index
  @books = Book.all
  @new_book = Book.new #投稿の部分テンプレート
  @user = current_user #user情報の部分テンプレート
 end

 #投稿詳細表示画面作成
 def show
  @book = Book.find(params[:id])
  @new_book = Book.new #投稿の部分テンプレート
  @user = current_user #user情報の部分テンプレート
 end

 #投稿削除
 def destroy
  @book = Book.find(params[:id])
  @book.destroy
    redirect_to books_path
 end

 #投稿編集
  def edit
   @book = Book.find(params[:id])
   if @book.user == current_user
   render "edit"
   end
  end

   def update
     @book = Book.find(params[:id])
     @book.user_id = current_user.id
      if @book.update(book_params)
       flash[:notice]="Book was successfully updated."
       redirect_to book_path(@book.id)
      else
       render "edit"
      end
   end

# 投稿データのストロングパラメータ
private

def book_params
 params.require(:book).permit(:title, :body)
end

  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    # redirect_to(root_path) unless @book
  end

end
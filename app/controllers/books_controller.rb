class BooksController < ApplicationController
 
 #新規投稿画面表示
 def new
 @book = Book.new
 end
 
 #投稿内容保存
 def create
 @book = Book.new(book_params)
 @book.user_id = current_user.id
 #falseならば、画像投稿ページを再表示
  if @book.save
    flash[:notice]="You have creatad book successfully."
   redirect_to books_path
  else
   @user = current_user
   @books = Book.all
   render :show
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
     else
      redirect_to books_path
     end
  end
  
   def update
     @book = Book.find(params[:id])
     @book.user_id = current_user.id
    if @book.update(post_params)
     flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
   end
   
# 投稿データのストロングパラメータ
private

def book_params
 params.require(:book).permit(:title, :body)
end


end

class BooksController < ApplicationController
 
 #新規投稿画面表示
 def new
 @book = Book.new
 end
 
 #投稿内容保存
 def create
 @book = Book.new(book_params)
 @book.user_id = current_user.id
 @book.save
 redirect_to books_path
 end
 
 #投稿リストを表示画面作成
 def index
  @books = Book.all
 end

 #投稿画像詳細表示画面作成
 def show
 end

 #投稿画像を削除する
 def destroy
 end
 
# 投稿データのストロングパラメータ
private

def book_params
 params.require(:book).permit(:title, :body)
end


end

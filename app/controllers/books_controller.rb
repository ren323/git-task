class BooksController < ApplicationController
before_action :correct_user, only: [:edit]

def authenticate_user
	if @current_path == nil
	redirect_to("/users/sign_in")
	end
end


def index
  @books = Book.all
  @book = Book.new
	@user = User.new
	end

def show
  @book = Book.find_by(id:params[:id])
  @user = User.new
end

def create
  @book = Book.new(book_params)
 @book.user_id = current_user.id
 	if @book.save
 		flash[:notice] = "Book was successfully create."
	    redirect_to book_path(@book.id)
	 else
	 	@books = Book.all
	    render :index
	end
end

def update
	@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "Book was successfully update."
	     redirect_to book_path(@book)
		else
			render :edit
	end
end

def edit

 @book = Book.find(params[:id])



















 
end

def destroy
	@book = Book.find(params[:id])
	@book.destroy
	flash[:notice] = "Book was successfully destroy."
	redirect_to books_path
end

private
	def book_params
	 params.require(:book).permit(:title, :body)
	end

	def correct_user
    @book = Book.find(params[:id])
    if current_user != @book.user
       redirect_to books_path
    end
  end

end



class UsersController < ApplicationController
def index
	@users = User.all
	@user = User.new
	@book=Book.new
end

def create
	@user = User.new(user_params)
		if @user.user_id = current_user.id
			@user.save
			flash[:notice] = "Book was successfully create."

	    redirect_to books_path(id: current_user)
	 else
	 	@users = User.all
	    render :index
	end
end

def show
    @books = Book.all
    @user=User.new
    @book = Book.new
end

  def create_book
    p params
    p book_params
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to user_path(current_user.id)

  end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
		if @user.update(user_params)
	 		flash[:notice] = "Book was successfully update."
	       redirect_to user_path(@user.id)
	 	else
    		render :edit
  		end

end

private
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
def book_params
    params.require(:book).permit(:title, :body)
end
end



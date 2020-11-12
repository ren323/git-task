class UsersController < ApplicationController
before_action :authenticate_user!, except: [:about]
before_action :correct_user, only: [:edit, :destroy, :update]
def about
end

def index
	@users = User.all
	@user = User.new
	@book=Book.new
end


def show
    @user= User.find(params[:id])
    @book = Book.new
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

	def correct_user
	    user = User.find(params[:id])
	    if current_user != user
	       redirect_to user_path(current_user)
	    end
	 end

end



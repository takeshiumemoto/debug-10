class BooksController < ApplicationController
    def index
        @books = Book.all
        @book = Book.new 
    end 
   
   
    def new
        @book = Book.new 
    end     
    
   
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id

        if @book.save
            redirect_to book_path(@book)
        else
            render :new  
        end
    end
    def show 
        @book = Book.find(params[:id])
        @user = @book.user
    end
    
    
    private 
    
    def book_params
        params.require(:book).permit(:title,:body)
    end     
end

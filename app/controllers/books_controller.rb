class BooksController < ApplicationController
    before_action :set_book,only:[:show,:edit,:destroy,:update]
    def index
        if params[:latest]
         @books = Book.latest
        elsif params[:old]
         @books = Book.old
        elsif params[:star_count]
         @books = Book.star_count
        else
          @books = Book.all
        end
        @book = Book.new 
    end 
    def new
        @book = Book.new 
    end     
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
      if@book.save
        flash[:notice]="You have created book successfully."
        redirect_to book_path(@book)
      else
        @books = Book.all
        render :index   
      end
    end
    
    def show 
    end
    
    def edit 
       if @book.user_id == current_user.id
           render :edit 
       else 
           redirect_to books_path
       end    
    end
    
    def update
        if @book.update(book_params)
           flash[:notice]="You have updated book successfully."    
           redirect_to @book
        else
          render 'edit'
        end 
    end     
    
    def destroy
        @book.destroy 
        redirect_to books_path
    end                           
    private 
    
    def book_params
        params.require(:book).permit(:title,:body,:star)
    end     
    def set_book
        @book = Book.find(params[:id])
    end 
end

class BoardsController < ApplicationController
    before_action :set_board, only: [:destroy]
    def index
        @boards = Board.all
    end

    def new
        @board = Board.new
    end
    
    def create
        board = Board.create(board_params)
        redirect_to board
    end

    def show
        @board = Board.find(params[:id])
    end

    def edit
        @board = Board.find(params[:id])
    end

    def update
        board = Board.find(params[:id])
        board.update(board_params)

        redirect_to board
    end

    def destroy
        binding.pry
        @board = Board.find(params[:id])
        @board.destroy
        respond_to do |format|
          format.html { redirect_to boards_path, notice: '削除が完了しました', status: :see_other }
          format.json { head :no_content }
        end
    end

    private

    def board_params
            params.require(:board).permit(:author_name, :title, :body )
    end

    def set_board
        @board = Board.find(params[:id])
    end
end
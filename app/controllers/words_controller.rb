class Api::WordsController < ApplicationController
    def index
      words = Word.find_all
      render json: words
    end
  
    def show
      word = Word.find_by_id(params[:id])
      if word
        render json: word
      else
        render json: { error: 'Word not found' }, status: :not_found
      end
    end
  
    def create
      word = Word.create(params[:word])
      render json: word, status: :created
    end
  
    def update
      if Word.update(params[:id], params[:word])
        render json: { message: 'Word updated successfully' }
      else
        render json: { error: 'Update failed' }, status: :unprocessable_entity
      end
    end
  
    def destroy
      if Word.delete(params[:id])
        render json: { message: 'Word deleted successfully' }
      else
        render json: { error: 'Deletion failed' }, status: :unprocessable_entity
      end
    end
  end
  
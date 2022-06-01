# frozen_string_literal: true

class Api::V1::CharactersController < ApplicationController
  def index
    characters = Characters::GetCharacters.call(params)
    render json: { data: characters }
  end

  def show
    character = Character.find(params[:id])
    render json: character
  end

  def create
    character = Characters::Creator.call(set_character_params)
    render json: character, status: :created
  end

  def update
    character = Characters::Updater.call(id: params[:id], params: set_character_params)
    render json: character
  end

  def destroy
    Characters::Destroyer.call(id: params[:id])
    head :no_content
  end

  private

  def set_character_params
    params.require(:character).permit(:name, :age, :weight, :story, :image)
  end
end

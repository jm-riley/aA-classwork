class Api::PokemonController < ApplicationController

  def index
    @pokemon = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render :show
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show
    else
      render @pokemon.errors.full_messages
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:image_url, :attack, :defense, :name, :poke_type, moves: [])
  end

end
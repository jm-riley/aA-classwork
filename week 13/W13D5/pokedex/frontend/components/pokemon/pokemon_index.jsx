import React from "react"
import PokemonIndexItem from "./pokemon_index_item"
import { Route } from "react-router-dom"
import PokemonDetail from "./pokemon_detail_container"
import PokemonFormContainer from "./pokemon_form_container"

class PokemonIndex extends React.Component {
  componentDidMount() {
    // debugger
    this.props.requestAllPokemon()
  }

  render() {
    const { pokemon } = this.props
    // debugger
    const pokemonList = pokemon.map((poke, i) => (
      <PokemonIndexItem pokemon={poke} key={i} />
    ))
    return (
      <div className="pokemon-main">
        <div className="pokemon-list">
          <ul>{pokemonList}</ul>
        </div>
        <div className="pokemon-right-container">
          <div>
            <Route path="/pokemon/:id" component={PokemonDetail} />
          </div>
          <div>
            <Route exact path="/" component={PokemonFormContainer} />
          </div>
        </div>
      </div>
    )
  }
}

export default PokemonIndex

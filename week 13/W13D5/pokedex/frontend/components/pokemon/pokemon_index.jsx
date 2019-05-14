import React from 'react'
import PokemonIndexItem from './pokemon_index_item';
import { Route } from 'react-router-dom'
import PokemonDetail from './pokemon_detail_container'

class PokemonIndex extends React.Component {

  componentDidMount() {
    // debugger
    this.props.requestAllPokemon()
  }

  render() {
    const { pokemon } = this.props
    const pokemonItems = pokemon.map((poke, i) => <PokemonIndexItem pokemon={poke} key={i}/> )
    return (
      <div>
        <div>
          <Route path="/pokemon/:id" component={PokemonDetail} />
        </div>
        <div>
          <ul>{pokemonItems}</ul>
        </div>
      </div>
    );
  }
}


export default PokemonIndex
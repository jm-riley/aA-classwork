import React from 'react'
import { Route, Link } from 'react-router-dom'
import ItemDetailContainer from './item_detail_container'

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.id)
  }

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.id !== this.props.match.params.id) {
      this.props.requestSinglePokemon(this.props.match.params.id);
    }
  }

  render() {
    const { items, pokemon } = this.props
    if (!items) return null
    // debugger
    let itemList = items.map((item, i) => {
      return (
        <Link to={`/pokemon/${pokemon.id}/items/${item.id}`} key={item.name}>
          <div><img src={item.image_url} alt="poke_item_img" width='30px'/></div>
        </Link>
      );
    })
    let pokeInfo, pokeMoves
    if (this.props.pokemon) {
      // const {pokemon} = this.props
      // debugger
      if (pokemon.moves) {
        pokeMoves = pokemon.moves.map((move, i) => {
          return (
            <li key={i}>{move}</li>

          )
        })
      }
      // console.log(pokemon.image_url)

      pokeInfo = (
        <div>
          <li>{pokemon.name}</li>
          <img src={pokemon.image_url} alt={pokemon.image_url} />
          <li>Attack: {pokemon.attack}</li>
          <li>Defense: {pokemon.defense}</li>
          <li>Type: {pokemon.poke_type}</li>
          <ul>Moves: {pokeMoves}</ul>
          <div>
            {itemList}
          </div>
        </div>
      );
    }
    // debugger

    return (
      <div>
        {pokeInfo}
        <Route path='/pokemon/:id/items/:itemId' component={ItemDetailContainer}/>
      </div>
    )
  }
}

export default PokemonDetail
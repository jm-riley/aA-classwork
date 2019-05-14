import { connect } from 'react-redux'
import {createPokemon} from '../../actions/pokemon_actions'
import PokemonForm from './pokemon_form'

const mdtp = dispatch => ({
  createPokemon: (pokemon) => dispatch(createPokemon(pokemon))
})

export default connect(null, mdtp)(PokemonForm)
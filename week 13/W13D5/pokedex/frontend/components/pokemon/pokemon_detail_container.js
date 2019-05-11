import {connect} from 'react-redux'
import {requestSinglePokemon} from '../../actions/pokemon_actions'

const mstp = (state) => ({

})

const mdtp = (dispatch) => ({
  requestSinglePokemon = dispatch(requestSinglePokemon())
})

export default connect(mstp, mdtp)(PokemonDetail)
export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/pokemon'
  })
}

export const fetchPokemonById = (id) => {
  return $.ajax({
    method: 'GET',
    url: `/api/pokemon/${id}`
  })
}

export const sendPokemonInfo = (data) => {
  return $.ajax({
    method: 'POST',
    url: 'api/pokemon',
    data: {data}
  })
}
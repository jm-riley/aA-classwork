import React from 'react'

const ItemDetail = ({ item }) => {
  return (
    <div>
      <img src={item.image_url} alt="item_img" width="100px"/>
      <div>{item.name}</div>
      <div>Price: {item.price}</div>
      <div>Happiness: {item.happiness}</div>
    </div>
  )
}

export default ItemDetail
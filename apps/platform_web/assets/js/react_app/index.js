// https://marmelab.com/blog/2015/12/17/react-directory-structure.html
//
// https://medium.freecodecamp.org/scaling-your-redux-app-with-ducks-6115955638be
//
// https://www.nylas.com/blog/structuring-a-complex-react-redux-project

import React from "react"
import ReactDOM from "react-dom"
import HomeContainer from "./src/home/home"
import "normalize.css"

ReactDOM.render(
  <HomeContainer/>, document.getElementById("wrapper")
)

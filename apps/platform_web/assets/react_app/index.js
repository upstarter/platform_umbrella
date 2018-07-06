// https://marmelab.com/blog/2015/12/17/react-directory-structure.html
//
// https://medium.freecodecamp.org/scaling-your-redux-app-with-ducks-6115955638be
//
// https://www.nylas.com/blog/structuring-a-complex-react-redux-project

import "phoenix_html"
import React from "react"
import ReactDOM from "react-dom"
import HomeContainer from "./src/home/home"
import NavContainer from "./src/common/nav/nav"

ReactDOM.render(
  <HomeContainer/>,
  document.getElementById("crypto-wise-app")
)

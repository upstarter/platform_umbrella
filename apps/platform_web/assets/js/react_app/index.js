// https://marmelab.com/blog/2015/12/17/react-directory-structure.html
//
// https://medium.freecodecamp.org/scaling-your-redux-app-with-ducks-6115955638be
//
// https://www.nylas.com/blog/structuring-a-complex-react-redux-project

import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "./src/common/nav/nav"
import HomeContainer from "./src/home/home"
import PressContainer from "./src/press/press"
import BlogContainer from "./src/blog/blog"

if (document.getElementById("crypto-wise-app")) {
  ReactDOM.render(
    <HomeContainer/>, document.getElementById("crypto-wise-app")
  )
}

if (document.getElementById("press")) {
  ReactDOM.render(
    <PressContainer/>, document.getElementById("press")
  )
}

if (document.getElementById("blog")) {
  ReactDOM.render(
    <BlogContainer/>, document.getElementById("blog")
  )
}

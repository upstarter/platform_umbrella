import React from "react"
import ReactDOM from "react-dom"
import HeroComponent from "../home/HeroComponent"
import FeaturesComponent from "../home/FeaturesComponent"
import BlogComponent from "../blog/BlogComponent"
// import Elm from 'react-elm-components'
// import {Main} from '../../../elm/src/Main'


export default class HomeComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <HeroComponent />
        <FeaturesComponent />
        <BlogComponent />
      </React.Fragment>
    )
  }
}

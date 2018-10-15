import React from "react";
import ReactDOM from "react-dom";
import HeroComponent from "./HeroComponent";
import FeaturesComponent from "./FeaturesComponent";
import BlogComponent from "../../views/blog/BlogComponent";
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
    );
  }
}

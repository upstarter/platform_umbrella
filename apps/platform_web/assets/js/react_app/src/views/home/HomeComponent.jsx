import React from "react";
import ReactDOM from "react-dom";
import HeroComponent from "./HeroComponent";
import NavContainer from "../../components/nav/nav";
import FeaturesComponent from "./FeaturesComponent";
import BlogComponent from "../../components/blog/BlogComponent";
// import Elm from 'react-elm-components'
// import {Main} from '../../../elm/src/Main'

export default class HomeComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <NavContainer />
        <HeroComponent />
        <FeaturesComponent />
        <BlogComponent />
      </React.Fragment>
    );
  }
}

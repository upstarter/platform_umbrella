import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../components/nav/nav";
import ProviderHeroComponent from "./ProviderHeroComponent"
import ProviderComponent from "./ProviderComponent"

export default class ProviderContainer extends React.Component {
  render() {
    return (
      <React.Fragment>
        <NavContainer url="/contribute"/>
        <ProviderHeroComponent />
        <ProviderComponent />
      </React.Fragment>
    )
  }
}

import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../nav/nav";
import ProviderHeroComponent from "../../providers/ProviderHeroComponent"
import PortfolioComponent from "./PortfolioComponent"

export default class PortfolioContainer extends React.Component {
  render() {
    return (
      <React.Fragment>
        <NavContainer url="/contribute"/>
        <PortfolioComponent />
      </React.Fragment>
    )
  }
}

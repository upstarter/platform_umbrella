import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../common/nav/nav"
import HomeComponent from "./HomeComponent"
import PanelContainer from "../common/panel/panel"

export default class HomeContainer extends React.Component {
  render() {
    return (
      <div>
        <NavContainer/>
        <HomeComponent />
      </div>
    )
  }
}

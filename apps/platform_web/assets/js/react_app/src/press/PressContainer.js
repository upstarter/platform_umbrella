import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../common/nav/nav"
import PressComponent from "./PressComponent"

export default class PressContainer extends React.Component {
  render() {
    return (
      <div>
        <NavContainer />
        <PressComponent />
      </div>
    )
  }
}

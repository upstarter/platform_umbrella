import React from "react"
import ReactDOM from "react-dom"
import { BrowserRouter, Switch, Route, Link } from "react-router-dom"

import HomeComponent from "./HomeComponent"
// import PanelContainer from "../common/panel/panel"
import PressComponent from "../press/PressComponent"
import BlogComponent from "../blog/BlogComponent"

export default class HomeContainer extends React.Component {
  render() {
    return (
      <div className="container">
        <BrowserRouter>
          <Switch>
            <Route exact path='/' component={HomeComponent}/>
            <Route exact path='/press' component={PressComponent}/>
            <Route exact path='/blog' component={BlogComponent}/>
          </Switch>
        </BrowserRouter>
      </div>
    )
  }
}

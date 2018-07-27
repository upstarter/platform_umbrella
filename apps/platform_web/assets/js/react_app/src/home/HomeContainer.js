import React from "react"
import ReactDOM from "react-dom"
import { BrowserRouter, Switch, Route, Link } from "react-router-dom"

import HomeComponent from "./HomeComponent"
import AboutComponent from "./AboutComponent"
import BlogComponent from "../blog/BlogComponent"
import ProviderContainer from "../providers/ProviderContainer"
import PrivacyComponent from "../common/PrivacyComponent"
import NavContainer from "../common/nav/nav"

export default class HomeContainer extends React.Component {
  render() {
    return (
      <React.Fragment>
        <BrowserRouter>
          <section id="container">
            <NavContainer />
            <Route exact path='/' component={HomeComponent}/>
            <Route exact path='/about' component={AboutComponent}/>
            <Route exact path='/blog' component={BlogComponent}/>
            <Route exact path='/contribute' component={ProviderContainer}/>
            <Route exact path='/privacy_policy' component={PrivacyComponent}/>
            <div id="footer">
              <p className="copyright">
                Copyright ©2018, Aion Labs, Inc.
              </p>
              <Link to="/privacy_policy" className="footer-link">Privacy Policy</Link>
            </div>
          </section>
        </BrowserRouter>
      </React.Fragment>
    )
  }
}

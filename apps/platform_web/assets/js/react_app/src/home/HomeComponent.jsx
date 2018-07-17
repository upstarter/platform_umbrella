import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../common/nav/nav"
import Elm from 'react-elm-components'
import {Main} from '../../../elm/src/Main'


export default class HomeComponent extends React.Component {
  render() {
    return (
      <div>
        <NavContainer />
        <div className="hero is-huge">
          <div className="hero-body">
            <h1 className="title">
              Cryptoasset media channel for serious investors and analysts.
            </h1>
            <h5 className="subtitle-big">
              Join in on the conversation & receive free investment analysis.
            </h5>
            <div className="scroll-to">
              <a className="icon">
                <i className="fa fa-chevron-down"></i>
              </a>
            </div>
            <div id="subscribe-form" className="email-leadgen">
              <section className="section">
                <div className="container is-fluid">
                  <div id="form_container">
                    <Elm src={Main} />
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

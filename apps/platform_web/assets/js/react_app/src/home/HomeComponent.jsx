import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../common/nav/nav"
import Elm from 'react-elm-components'
import {Main} from '../../../elm/src/Main'


export default class HomeComponent extends React.Component {
  render() {
    return (
      <div className="container">
        <NavContainer />
        <div className="hero">
          <div className="hero-body">
            <div className="container is-fluid">
              <h1 className="title">
                Wiser cryptoasset investing starts with the ecosystem.
              </h1>
              <h5 className="subtitle-big">
                Join the conversation & receive free insights.
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
      </div>
    )
  }
}

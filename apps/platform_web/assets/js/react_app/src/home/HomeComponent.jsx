import React from "react"
import ReactDOM from "react-dom"
import FeaturesComponent from "../home/FeaturesComponent"
import Elm from 'react-elm-components'
import {Main} from '../../../elm/src/Main'


export default class HomeComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <section className="heero is-small columns">
          <div className="heero-body column">
            <div className="container">
              <h1 className="title">
                Wiser cryptoasset investing starts with the ecosystem.
              </h1>
              <p className="subtitle-big">
                Receive free investing insights & join the conversation.
              </p>
              <div className="scroll-to">
                <a className="icon">
                  <i className="fa fa-chevron-down"></i>
                </a>
              </div>
              <div id="subscribe-form" className="email-leadgen">
                <section className="section">
                  <div className="container has-text-centered">
                    <div id="form-container">
                      <Elm src={Main} />
                    </div>
                  </div>
                </section>
              </div>
            </div>
          </div>
        </section>
        <FeaturesComponent />
      </React.Fragment>
    )
  }
}

import React from "react"
import ReactDOM from "react-dom"
import Elm from 'react-elm-components'
import {Main} from '../../../elm/src/Main'


export default class ProviderHeroComponent extends React.Component {
  render() {
    var flags = { userType: "provider" };

    return (
      <section className="heero">
        <div className="heero-body column">
          <div className="container">
            <h1 className="title">
              <span className="fancy-underline">Monetize</span> your crypto capabilities.
            </h1>
            <p className="subtitle-big">
              Earn $USD while contributing to the crypto ecosystem.
            </p>
            <div id="subscribe-form" className="email-leadgen">
              <section className="section">
                <div className="container has-text-centered">
                  <div id="form-container">
                    <Elm src={Main} flags={flags}/>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

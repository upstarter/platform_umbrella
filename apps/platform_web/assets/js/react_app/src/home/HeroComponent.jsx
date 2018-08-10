import React from "react"
import ReactDOM from "react-dom"
// import Elm from 'react-elm-components'
// import {Main} from '../../../elm/src/Main'


export default class HeroComponent extends React.Component {

  render() {
    var flags = { userType: "investor" };

    return (
      <section className="heero">
        <div className="heero-body column">
          <div className="container">
            <h1 className="title">
              Become a <span className="fancy-underline">top 1%</span> crypto investor.
            </h1>
            <p className="subtitle-big">
              Receive free insights in your inbox.
            </p>
            <div id="subscribe-form" className="email-leadgen">
              <section className="section">
                <div className="container has-text-centered">
                  <div id="form-container">
                    {/* <Elm src={Main} flags={flags} /> */}
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

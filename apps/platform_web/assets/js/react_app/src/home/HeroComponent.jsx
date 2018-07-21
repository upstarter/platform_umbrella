import React from "react"
import ReactDOM from "react-dom"
import Elm from 'react-elm-components'
import {Main} from '../../../elm/src/Main'


export default class HeroComponent extends React.Component {
  render() {
    return (
      <section className="heero">
        <div className="heero-body column">
          <div className="container">
            <h1 className="title">
              Become a <span className="fancy-underline">top 1%</span> crypto investor.
            </h1>
            <p className="subtitle-big">
              Receive free insights in your inbox to read at your leisure. Also we will notify you when our platform launches.
            </p>
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
        <div className="scroll-to is-hidden-desktop">
          <a className="icon">
            <i className="fa fa-chevron-down"></i>
          </a>
        </div>
      </section>
    )
  }
}

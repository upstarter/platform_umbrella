import React from "react"
import ReactDOM from "react-dom"

export default class HomeComponent extends React.Component {
  render() {
    return (
      <div className="main-wrapper">
        <div className="hero is-huge">
          <div className="hero-body">
            <h1 className="subtitle tagline">
              Join the Cryptoasset intelligence platform made up of expert traders, investors, and analysts.
            </h1>
            <h5 className="sub-tagline">
              Join the waitlist for early access.
            </h5>
            <div className="scroll-to">
              <a className="icon">
                <i className="fa fa-chevron-down"></i>
              </a>
            </div>
            <div id="subscribe-form" className="email-leadgen">
              <section className="section">
                <div className="container is-fluid">
                  <div id="form_container"></div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

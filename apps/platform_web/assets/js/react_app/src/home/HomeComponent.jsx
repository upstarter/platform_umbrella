import React from "react"
import ReactDOM from "react-dom"

export default class HomeComponent extends React.Component {
  render() {
    return (
      <div className="main-wrapper columns">
        <div className="hero is-huge">
          <div className="hero-body">
            <h1 className="subtitle tagline">
              Your customized Cryptoasset investment intelligence platform.
            </h1>
            <h5 className="sub-tagline">
              Beta coming soon. Sign up to stay in the loop.
            </h5>
            <div className="scroll-to">
              <a className="icon">
                <i className="fa fa-chevron-down"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

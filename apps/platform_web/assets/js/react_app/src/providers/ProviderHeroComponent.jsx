import React from "react";
import ReactDOM from "react-dom";
// import Elm from 'react-elm-components'
// import {Main} from '../../../elm/src/Main'
import Button from "../components/Button/Button";

export default class ProviderHeroComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      applyNowButtonLoading: false
    };
  }
  render() {
    var flags = { userType: "provider" };
    let state = this.state;
    return (
      <section className="heero">
        <div className="heero-body column">
          <div className="container">
            <h1 className="title">
              <span className="fancy-underline">Monetize</span> your crypto
              capabilities.
            </h1>
            <p className="subtitle-big">
              Earn money for contributing to the crypto economy.
            </p>
            <div id="subscribe-form" className="email-leadgen">
              <section className="section">
                <div className="container has-text-centered">
                  <div id="form-container">
                    {/* <Elm src={Main} flags={flags}/> */}
                    <input
                      className="input"
                      type="text"
                      placeholder="Text input"
                    />
                    <Button
                      className={`is-primary is-rounded ${
                        state.applyNowButtonLoading ? "is-loading" : null
                      }`}
                    >
                      {" "}
                      Apply Now{" "}
                    </Button>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </section>
    );
  }
}

import React from "react";
import ReactDOM from "react-dom";
// import Elm from 'react-elm-components'
// import {Main} from '../../../elm/src/Main'
import Button from "../../components/Button/Button";

export default class HeroComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      subscribeButtonLoading: false
    };
  }
  render() {
    var flags = { userType: "investor" };
    let state = this.state;
    return (
      <section className="heero">
        <div className="heero-body column">
          <div className="container">
            <h1 className="title">
              Become a <span className="fancy-underline">top 1%</span> crypto
              investor.
            </h1>
            <p className="subtitle-big">Receive free insights in your inbox.</p>
            <div id="subscribe-form" className="email-leadgen">
              <section className="section">
                <div className="container has-text-centered">
                  <div id="form-container">
                    <input
                      className="input"
                      type="text"
                      placeholder="Text input"
                    />
                    <Button
                      className={`is-primary is-rounded ${
                        state.subscribeButtonLoading ? "is-loading" : null
                      }`}
                    >
                      {" "}
                      Subscribe{" "}
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

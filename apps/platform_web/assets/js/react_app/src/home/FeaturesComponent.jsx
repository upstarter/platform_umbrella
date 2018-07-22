import React from "react"
import ReactDOM from "react-dom"

export default class FeaturesComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <div className="features-wrapper container">
          <div className="scroll-to is-hidden-desktop">
            <a className="icon">
              <i className="fa fa-chevron-down"></i>
            </a>
          </div>
          <h1 className="features-heading">Features</h1>
          <section className="features columns">
            <div className="feature column">
              <div className="feature-icon">
                <figure className="image">
                  <img alt="Grow your cryptoasset investments" src="/images/icon1.svg"/>
                </figure>
              </div>
              <h3>Investment Strategies</h3>
              <p className="subtitle-small">
                It takes sophisticated methods to construct, manage and
                optimize a cryptoasset portfolio. We help with
                the complex bits.
              </p>
            </div>
            <div className="feature column">
              <div className="feature-icon">
                <figure className="image">
                  <img alt="Informed investment insights" src="/images/icon2.svg"/>
                </figure>
              </div>
              <h3>Informed Investment Insights</h3>
              <p className="subtitle-small">
                Free access to cryptoasset market insights & financial analysis written
                by a passionate community of crypto and finance experts.
              </p>
            </div>
            <div className="feature column">
              <div className="feature-icon">
                <figure className="image">
                  <img alt="Grow your " src="/images/icon3.svg"/>
                </figure>
              </div>
              <h3>Intelligent Software Platform</h3>
              <p className="subtitle-small">
                Intelligent Agents deliver novel personalized opportunites
                and guidance based on preferences.
              </p>
            </div>
          </section>
        </div>
      </React.Fragment>
    )
  }
}

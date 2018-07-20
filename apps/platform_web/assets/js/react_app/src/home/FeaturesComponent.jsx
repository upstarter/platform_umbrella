import React from "react"
import ReactDOM from "react-dom"

export default class FeaturesComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <section className="features columns">
          <div className="feature1 column">
            <div class="icon1">
              <figure class="image">
                <img alt="Grow your cryptoasset investments" src="/images/icon1.svg"/>
              </figure>
            </div>
            <h3>Portfolio Construction & Optimization</h3>
            <p className="subtitle-small">
              It takes sophisticated methods to manage and
              optimize a portfolio of cryptoassets. Let our software manage
              the complex bits.
            </p>
          </div>
          <div className="feature2 column">
            <div class="icon2">
              <figure class="image">
                <img alt="Community informed investment insights" src="/images/icon2.svg"/>
              </figure>
            </div>
            <h3>Community Informed Investment Insights</h3>
            <p className="subtitle-small">
              Free access to cryptoasset market insights & financial analysis written
              by our community of crypto-finance experts.
            </p>
          </div>
          <div className="feature3 column">
            <div class="icon3">
              <figure class="image">
                <img alt="Grow your " src="/images/icon3.svg"/>
              </figure>
            </div>
            <h3>Intelligent Software Platform</h3>
            <p className="subtitle-small">
              Intelligent Agents optimized for delivering novel personalized opportunites
              and guidance based on your interests and risk tolerance.
            </p>
          </div>
        </section>
      </React.Fragment>
    )
  }
}

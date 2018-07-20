import React from "react"
import ReactDOM from "react-dom"

export default class FeaturesComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <section className="features content">
          <div className="feature1">
            <div class="icon1">
              <figure class="image">
                <img alt="Grow your cryptoasset investments" src="/images/icon1.svg"/>
              </figure>
            </div>
            <div className="title">Portfolio Construction & Optimization</div>
            <p className="subtitle-small">
              It takes sophisticated methods to manage and
              optimize a portfolio of cryptoassets. Let our software manage
              the complex bits.
            </p>
          </div>
          <div className="feature2">
            <div class="icon2">
              <figure class="image">
                <img alt="Community informed investment insights" src="/images/icon2.svg"/>
              </figure>
            </div>
            <div className="title">Community Informed Investment Insights</div>
            <p className="subtitle-small">
              Free access to cryptoasset market insights & financial analysis written
              by our community of crypto-finance experts.
            </p>
          </div>
          <div className="feature3">
            <div class="icon3">
              <figure class="image">
                <img alt="Grow your " src="/images/icon3.svg"/>
              </figure>
            </div>
            <div className="title">Intelligent Software Platform</div>
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

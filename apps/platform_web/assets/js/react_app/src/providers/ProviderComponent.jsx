import React from "react"
import ReactDOM from "react-dom"

export default class ProviderComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <section className="provider-contribute-wrapper container">
          <div className="scroll-to is-hidden-desktop">
            <a className="icon">
              <i className="fa fa-chevron-down"></i>
            </a>
          </div>
           <div id="provider-text">
            <h1 className="provider-heading">
              Seeking Experts
            </h1>
            <p>
              We're building the Dow Jones of Cryptoassets and we're seeking
              high quality finance and crypto article submissions. Join our
              wise, talented, and passionate network of  analysts, researchers,
              economists and industry experts who are focused on helping to form
              the future of crypto technology by sharing insights and ideas. Our
              editors curate news, research, opinion and discussion on key
              topics of interest to crypto investors in order to help them make
              better financial decisions.
            </p>
            <br />
            <p>
              If your interested in generating income through analysis of
              pertinent topics in categories relevant to investors-- we would love to hear from you.
            </p>
            <br/>
            <h3>How it Works</h3>
            <p>
              Submit your email address above if you are uniquely qualified to
              contribute articles on the topics in our universe of discourse in
              the context of cryptoassets. We will send you a link to
              our contributor application. After you apply we will get back to
              you if there is a good fit.
            </p>
            <br/>
            <h3>Some of the topics in our current universe of
              discourse:</h3>

            <div className="topics columns subtitle-small">
              <div className="crypto-finance column">
                <ul>
                  <li className="topic">Cryptoeconomics</li>
                  <li className="topic">Decentralized Apps (Dapps)</li>
                  <li className="topic">Cryptocurrencies</li>
                  <li className="topic">ERC-XX</li>
                  <li className="topic">Regulatory</li>
                  <li className="topic">Compliance</li>
                  <li className="topic">CryptoCloud Compute</li>
                  <li className="topic">CryptoCloud Storage</li>
                  <li className="topic">Sustainability</li>
                  <li className="topic">Transformative Tech</li>
                  <li className="topic">Social Impact</li>
                </ul>
              </div>
              <div className="emerging-tech column">
                <ul>
                  <li className="topic">Crypto Investment Strategy</li>
                  <li className="topic">Global Asset Allocation</li>
                  <li className="topic">Trading Systems & Methods</li>
                  <li className="topic">Decentralized Exchanges</li>
                  <li className="topic">Portfolio Optimization</li>
                  <li className="topic">Game Theory</li>
                  <li className="topic">Mechanism Design</li>
                  <li className="topic">Artificial Intelligence</li>
                  <li className="topic">Robotics</li>
                  <li className="topic">Internet of Things</li>
                  <li className="topic">Taxes</li>
                </ul>
              </div>
            </div>
          </div>
        </section>
      </React.Fragment>
    )
  }
}

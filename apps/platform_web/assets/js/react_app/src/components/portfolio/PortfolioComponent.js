import React from "react"
import ReactDOM from "react-dom"

export default class PortfolioComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <section id="portfolio" className="light-wrap">
          <div className="scroll-to is-hidden-desktop">
            <a className="icon">
              <i className="fa fa-chevron-down"></i>
            </a>
          </div>
           <div id="portfolio-text" className="content centered">
            <h1 className="title portfolio-heading">
              The CryptoWise Collaborative Portfolio (CCP)
            </h1>
            <p>
              Curated by the wisest minds in crypto. Enter your portfolio allocation
              and we will send you regular wisdom of the crowd updates.
            </p>
            <h1>React Table Grid Goes Here</h1>
          </div>
        </section>
      </React.Fragment>
    )
  }
}

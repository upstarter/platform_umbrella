import React from "react"
import ReactDOM from "react-dom"

export default class PressComponent extends React.Component {
  render() {
    return (
      <React.Fragment>
        <section id="normal-wrap" className="press text">
          <div id="press-content">
            <div className="team-image">
              <div className="title">Team</div>
              <figure className="image">
                <img alt="Placeholder image" src="/images/team.png"/>
              </figure>
            </div>
            <br/>
            <div className="title">About</div>
            <p>
              CryptoWise is a Robo-Advisory
              connecting investors with expert level cryptoasset financial analysis.
              Investors gain from our contributors abilities to enrich and synthesize
              high quality due diligence on promising crypto projects.
              <i>We're tapping into the acquired wisdom and innate talent of those most passionate
                about the future of money and capital formation.
              </i>
            </p>
            <br/>
            <div className="title">Mission</div>
            <p>To help forward-looking investors succeed through
              community-driven research & analysis. We believe that everyone should
              have the capabilities of a venture capitalist, and that fintech and crypto
              literacy are critical skills for the modern workforce. We are
              creating a source of wisdom and guidance for principled investors.
            </p>
            <br/>
            <div className="title">Values</div>
            <p>Transparency, Integrity, Openness, Empowerment,
              Curiosity, Accuracy, Precision, Autonomy,
              Self Discipline, Dedication, Compassion, Originality, Humor, Fun.
            </p>
            <br/>
            <div className="title">Pursuits</div>
            <p>Cryptoasset & Distributed Ledger Technology, Crypto Economics, Investing & Trading Strategies & Methods,
              Portfolio Management, Dapps, Algorithms & AI, Software Architecture & Systems Design,
              Growth Engineering, Emerging Tech, Internet of Things,
              Multi-Agent Reinforcement Learning, Cognitive & Social Sciences.
            </p>
          </div>
        </section>
      </React.Fragment>
    )
  }
}

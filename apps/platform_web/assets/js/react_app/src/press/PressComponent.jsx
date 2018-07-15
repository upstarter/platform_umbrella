import React from "react"
import ReactDOM from "react-dom"
import NavContainer from "../common/nav/nav"

export default class PressComponent extends React.Component {
  render() {
    return (
      <div>
        <NavContainer />
        <div class="landing-page" style={{margin: '50px auto', width: '50%', color: 'white'}}>
          <div class="landing-page">
            <div class="press">
              <div id="press_content">
                <div class="team-image">
                  <div class="title">Team</div>
                  <figure class="image">
                    <img alt="Placeholder image" src="/images/team.png"/>
                  </figure>
                </div>
                <br/>
                <div class="title">About</div>
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
                <div class="title">Mission</div>
                <p>To help forward-looking investors and analysts achieve valuable accomplishments by providing them with
                  advanced software capabilities and community-driven research & analysis.
                </p>
                <br/>
                <div class="title">Values</div>
                <p>Transparency, Integrity, Openness, Empowerment,
                  Curiosity, Accuracy, Precision, Autonomy,
                  Self Discipline, Dedication, Compassion, Originality, Humor, Fun.
                </p>
                <br/>
                <div class="title">Pursuits</div>
                <p>Cryptoasset & Distributed Ledger Technology, Crypto Economics, Investing & Trading Strategies & Methods,
                  Portfolio Management, Dapps, Algorithms & AI, Software Architecture & Systems Design,
                  Growth Engineering, Emerging Tech, Internet of Things,
                  Multi-Agent Reinforcement Learning, Cognitive & Social Sciences.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

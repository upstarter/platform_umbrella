import React from 'react'
import ReactDOM from 'react-dom'
import injectSheet, { jss } from 'react-jss'
// import colors from '../../styles/colors'
// import BarChart from "../../components/charts/bar"


class AboutComponent extends React.Component {
  render() {
    const { classes } = this.props
    return (
      <React.Fragment>
        <section id="about" className={classes.about}>
          <div id="about-content" className="content">
            <h1 className="title">About</h1>
            <h3 className="subtitle">
              CryptoWise is a collaborative investment ecosystem harnessing the
              wisdom of the crowd and AI to optimize individual & collective
              investment outcomes.
            </h3>
            <p className="paragraph">
              We are connecting investors with expert level cryptoasset
              financial analysis and next-generation cloud capabilities for
              automated, scalable data gathering, insight generation, and
              decision-making. <i> We're harnessing the acquired wisdom and
              innate talent of those most passionate about the future of investing
              and capital formation. </i>
            </p>
            <h1 className="title">Vision</h1>
            <h3 className="subtitle">
              Research has shown that a collective entity makes a better
              decision as a whole than the most intelligent person in the
              group alone.
            </h3>
            <blockquote
            cite="https://www.goodreads.com/work/quotes/3250675-the-wisdom-of-crowds">
              Groups are only smart when there is a balance between the
              information that everyone in the group shares and the information
              that each of the members of the group holds privately. It&#39;s the
              combination of all those pieces of independent information, some of
              them right, some of the wrong, that keeps the group wise. - James
              Surowiecki, The Wisdom of Crowds
            </blockquote>

            <p className="">
              We are prototyping web-native solutions for crypto analysts,
              researchers, academics-- to seed and enrich the network with an
              injection and synthesis of scientific values. As natural
              cryptoeconomics take root, guided via game theory & mechanism
              design, the result will be a Cambrian explosion of new investment
              and trading opportunities for the next generation of investors to
              capitalize on.
            </p>
            <h1 className="title">Mission</h1>
            <p>
              To help forward-looking investors succeed through in-depth
              community-driven research & analysis. We believe that everyone
              should have the capabilities of a venture capitalist, and that
              fintech and crypto literacy are critical skills of the future.
              Becoming highly investing saavy will help americans through the
              looming evaporation of social security and help to prevent a
              retirement crisis in the making. We are creating a source of
              wisdom and guidance for principled investors.
            </p>
            <h1 className="title">Values</h1>
            <p>
              Transparency, Integrity, Openness, Authenticity, Curiosity,
              Accuracy, Precision, Autonomy, Dedication, Compassion,
              Originality, Humor, Fun.
            </p>
            <h1 className="title">Pursuits</h1>
            <p>
              Cryptoasset & Distributed Ledger Technology, Crypto Economics,
              Trading Strategies & Methods, Portfolio Management, Dapps,
              Algorithms & AI, Software Architecture, Growth Engineering,
              Emerging Tech, Internet of Things, Multi-Agent Reinforcement
              Learning, Cognitive Computing & Social Sciences.
            </p>
          </div>
        </section>
      </React.Fragment>
    )
  }
}

const aboutStyles = {
  about: {
    '& #about-content': {
      padding: '2rem 1rem 1rem 1rem',
      marginTop: '4rem',
      margin: '0 auto',
      maxWidth: '60ch',


      '@media (min-width: 992px)': {
        width: '60ch',
      },

      '@media (min-width: 576px and max-width: 992px)': {
        width: '95vw',
      },

      '@media (min-width: 576px)': {
        width: '95vw',
      },

      '& .team-image': {
        '& .image': {
          border: 'double .4rem #AEBED4',
          backgroundOrigin: 'border-box',
          backgroundClip: 'content-box, border-box',
        }
      }
    }
  }
}

export default injectSheet(aboutStyles)(AboutComponent)

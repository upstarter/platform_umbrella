import React from 'react'
import ReactDOM from 'react-dom'
import injectSheet, { jss } from "react-jss"
import colors from '../../styles/colors'

class FeaturesComponent extends React.Component {
  render() {
    const {classes}= this.props;
    return (
      <React.Fragment>
        <section id="features" className={classes.features, 'dark-wrap'}>
          <div className="section-heading">
            <h1>Features</h1>
          </div>
          <div className="features columns">
            <div className={classes.feature}>
              <div className="feature-icon">
                <figure className="image">
                  <img alt="Crypto investing strategies" src="/images/icon1.svg"/>
                </figure>
              </div>
              <h3>Crypto Investing Strategy</h3>
              <p className="subtitle-small">
                It takes sophisticated methods to construct, manage and
                optimize a cryptoasset portfolio. Get help with
                the complex bits.
              </p>
            </div>
            <div className={classes.feature}>
              <div className="feature-icon">
                <figure className="image">
                  <img alt="Crypto Investing" src="/images/icon2.svg"/>
                </figure>
              </div>
              <h3>Crypto Financial Analysis</h3>
              <p className="subtitle-small">
                Free access to cryptoasset market insights & financial analysis written
                by a passionate community of crypto and finance experts.
              </p>
            </div>
            <div className={classes.feature}>
              <div className="feature-icon">
                <figure className="image">
                  <img alt="Crypto Trading, Crypto Investing" src="/images/icon3.svg"/>
                </figure>
              </div>
              <h3>Collaborative Investment Platform</h3>
              <p className="subtitle-small">
                Intelligent Agents deliver novel personalized opportunites
                and guidance based on preferences.
              </p>
            </div>
          </div>
        </section>
      </React.Fragment>
    )
  }
}

const featuresStyles = {
  features: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
  },

  feature: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    textAlign: 'center',
    '& .feature-icon': {
      padding: '.7rem',
      height: '55px',
      width: '50px',
    },
    '& .subtitle-small': { maxWidth: '35rem' }
  }
}

export default injectSheet(featuresStyles)(FeaturesComponent)

import React from 'react'
import ReactDOM from 'react-dom'
import injectSheet, { jss } from 'react-jss'
import ScrollToTopOnMount from '../../utils/ScrollToTopOnMount'
// import colors from '../../styles/colors'
// import BarChart from "../../components/charts/bar"


class DeveloperComponent extends React.Component {
  render() {
    const { classes } = this.props
    return (
      <React.Fragment>
        <ScrollToTopOnMount/>
        <section id="developer" className={classes.developers}>
          <div id="developer-content" className="content">
            <h1>CryptoWise for Developers</h1>
            <h5 className="subtitle">
              CryptoWise is empowering developers to form new knowledge markets
              on the blockchain, which will allow knowledge and truth seekers to
              connect, cooperate, and compete without requiring any trusted
              intermediaries. Achieving this visionary goal requires
              contributions from a growing community of developers; And we need
              your help.
            </h5>

          </div>
        </section>
      </React.Fragment>
    )
  }
}

const devStyles = {
  developers: {
    '& #developer-content': {
      padding: '0rem 1rem 1rem 1rem',
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
    }
  }
}

export default injectSheet(devStyles)(DeveloperComponent)

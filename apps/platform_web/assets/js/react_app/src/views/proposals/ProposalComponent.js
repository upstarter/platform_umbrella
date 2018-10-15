import React from 'react'
import ReactDOM from 'react-dom'
import injectSheet, { jss } from 'react-jss'
// import colors from '../../styles/colors'
// import BarChart from "../../components/charts/bar"


class ProposalComponent extends React.Component {
  render() {
    const { classes } = this.props
    return (
      <React.Fragment>
        <section id="proposal" className={classes.proposals}>
          <div id="proposal-content" className="content">
            <h1 className="title">Proposals</h1>
            <h3 className="subtitle">
              CryptoWise is empowering proposals to form new knowledge markets
              on the blockchain, which will allow knowledge and truth seekers to
              connect, cooperate, and compete without requiring any trusted
              intermediaries. Achieving this visionary goal requires
              contributions.
            </h3>
            <p className="paragraph">

            </p>
            <h1 className="title">Vision</h1>
            <h3 className="subtitle">
=
            </h3>


            <p className="">

            </p>
            <h1 className="title">Mission</h1>
            <p>

            </p>
            <h1 className="title">Values</h1>
            <p>

            </p>
            <h1 className="title">Pursuits</h1>
            <p>
            </p>
          </div>
        </section>
      </React.Fragment>
    )
  }
}

const proposalStyles = {
  proposals: {
    '& #proposal-content': {
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

export default injectSheet(proposalStyles)(ProposalComponent)

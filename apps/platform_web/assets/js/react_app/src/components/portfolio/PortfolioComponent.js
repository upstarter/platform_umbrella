import React from "react";
import ReactDOM from "react-dom";
import { url } from "../../utils/consts";
import PortfolioGrid from "../datagrid/PortfolioGrid";
import injectSheet, { jss } from "react-jss"

class PortfolioComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tokens: [],
      selectedToken: null,
      isLoading: true,
      error: null
    };
  }

  componentDidMount() {
    console.log(`${url}/api/v1/portfolios/new`);

    this.setState({
      isLoading: true
    });

    fetch(`${url}/api/v1/portfolios/new`)
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error("Something went wrong ...");
        }
      })
      .then(data =>
        this.setState({
          blogPosts: data.portfolio,
          selectedPost: data.portfolio[0],
          isLoading: false
        })
      )
      .catch(error =>
        this.setState({
          error,
          isLoading: false
        })
      );
  }

  render() {
    const { classes } = this.props;
    return (
      <React.Fragment>
        <section id="portfolio" className={classes.portfolio, "light-wrap"}>
          <div id="portfolio-text" className="content" style={{maxWidth: '500px', display: 'flex', flexDirection: 'column'}}>
            <h1 className="title center" style={{textAlign: 'center'}}>
              The CryptoWise Portfolio
            </h1>
            <h5 className="center" style={{alignItems: 'center', maxWidth: '60ch', textAlign: 'center'}}>
              Allocate a portfolio from our painstakingly and continuously re-constructed
              synthesis of top cryptoasset selections of some of the
              wisest financial analysts in the cryptosphere. Enter and update
              your 'optimal' portfolio allocation to see how you compare to the
              best performing portfolios over specified time periods. Top spots
              on leaderboards will get preferred access on any future token
              sale.
            </h5>
            <br />
            <div className="portfolio-grid center">
              <PortfolioGrid />
            </div>
          </div>
        </section>
      </React.Fragment>
    );
  }
}

const portfolioStyles = {
  portfolio: {
    color: 'red',
    height: '100vh',
    padding: '2rem 0',
    margin: '0 auto',
    width: '95vw',

    '@media (min-width: 992px)': {
      width: '70ch'
    },

   '@media (min-width: 576px)': {
      width: '95vw'
    }
  }
}
export default injectSheet(portfolioStyles)(PortfolioComponent);

import React from "react";
import ReactDOM from "react-dom";
import { url } from "../../utils/consts";
import PortfolioGrid from "../../components/datagrid/PortfolioGrid";
import injectSheet, { jss } from "react-jss";
import { Layout, Icon } from "antd";
const { Content } = Layout;

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
      <div
        style={{
          maxWidth: "600px",
          textAlign: 'center',
          margin: "0 auto",
          height: '100vh'
        }}
      >
        <h1>The CryptoWise Portfolio</h1>
        <h5>
          Allocate a portfolio from our painstakingly and continuously
          re-constructed synthesis of top cryptoasset selections of some of the
          wisest financial analysts in the cryptosphere. Enter and update your
          'optimal' portfolio allocation to see how you compare to the best
          performing portfolios over specified time periods. Top spots on
          leaderboards will get preferred access on any future token sale.
        </h5>
        <br />
          <PortfolioGrid />
      </div>
    );
  }
}

const portfolioStyles = {};
export default injectSheet(portfolioStyles)(PortfolioComponent);

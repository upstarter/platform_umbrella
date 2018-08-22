import React, { Component } from "react";
import { connect } from "react-redux";
import Chart from "../components/chart";

class TokenList extends Component {
  renderToken(tokenData) {
    const name = tokenData.name;
    const prices = tokenData.list.map(token => token.prices);

    return (
      <tr key={name}>
        <td><Chart data={prices} color="black" units="%" /></td>
      </tr>
    );
  }

  render() {
    return (
      <table className="table table-hover">
        <thead>
          <tr>
            <th>Hodling</th>
            <th>Allocation (%)</th>
          </tr>
        </thead>
        <tbody>
          {this.props.tokens.map(this.renderToken)}
        </tbody>
      </table>
    );
  }
}

function mapStateToProps({ weather }) {
  return { weather };
}

export default connect(mapStateToProps)(TokenList);

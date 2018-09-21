import React from "react";
import update from "immutability-helper";
import SearchBarContainer from "../search/searchBarContainer";

import tokens from "./MockData";

export default class PortfolioGrid extends React.Component {
  constructor() {
    super();
    this.state = {
      holdings: [{ holding: "", allocation: null }]
    };
    this.addRow = this.addRow.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  addRow = e => {
    if (this.state.holdings.length < 7) {
      this.setState(prevState => ({
        holdings: [...prevState.holdings, { holding: "", allocation: "" }]
      }));
    }
  };
  handleSubmit = e => {
    e.preventDefault();
  };
  handleChange = e => {
    if (["holding", "allocation"].includes(e.target.className)) {
      let holdings = [...this.state.holdings];
      holdings[e.target.dataset.id][e.target.className] = e.target.value;
      this.setState({ holdings }, () => console.log(this.state.holdings));
    } else {
      let holdings = [...this.state.holdings];
      holdings[e.target.dataset.id][e.target.className] = e.target.value;
      this.setState({ holdings });
    }
  };
  render() {
    let { holdings } = this.state;
    return (
      <div>
        {/* <div class="notification is-info">
          <button class="delete" />
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit euismod...
          </p>
        </div> */}
        <div>
          Total Weight: <strong>{`${this.state.totalWeight}%`}</strong>
        </div>
        <div className="">
          <form onSubmit={this.handleSubmit} onChange={this.handleChange}>
            <table className="table is-fullwidth is-bordered">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Holding</th>
                  <th>Allocation</th>
                  <th />
                </tr>
              </thead>
              <tbody>
                {holdings.map((val, idx) => {
                  let holdingId = `holding-${idx}`,
                    allocationId = `allocation-${idx}`;
                  return (
                    <tr>
                      <td>{idx + 1}</td>
                      <td className="has-input">
                        <div className="select is-small">
                          <select
                            className="holding"
                            name={holdingId}
                            id={holdingId}
                            data-id={idx}
                          >
                            <option value="qwe">Choose</option>
                            {tokens.map((token, i) => {
                              return (
                                <option value={token.holding}>
                                  {token.holding}
                                </option>
                              );
                            })}
                          </select>
                        </div>
                      </td>
                      <td className="has-input">
                        <input
                          className="allocation"
                          type="text"
                          name={allocationId}
                          id={allocationId}
                          data-id={idx}
                          // onFocus={this.addRow}
                          // value={this.state.holdings[idx].allocation}
                        />
                      </td>

                      <td className="has-input">
                        <span
                          className="icon"
                          // onClick={i => this.deleteRow(i)}
                          style={{ cursor: "pointer" }}
                        >
                          <i className="fas fa-trash" />
                        </span>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
            <button onClick={this.addRow} className="button is-primary">
              Add another asset
            </button>
            <a className="button">
  <span className="icon">
    <i className="fas fa-heading fa-lg"></i>
  </span>
  </a>
            <div onClick={this.handleSubmit} style={styles.submitBtn}>
              Submit Portfolio
            </div>
          </form>
        </div>

        {this.state.error && <div style={styles.error}>{this.state.error}</div>}
      </div>
    );
  }
}

const styles = {
  addRowBtn: {
    width: "100%",
    fontSize: 16,
    padding: "4px",
    textAlign: "center",
    color: "#222",
    marginTop: 15,
    border: "1px solid #783D6F",
    borderRadius: 4,
    cursor: "pointer"
  },
  submitBtn: {
    width: "100%",
    fontSize: 16,
    padding: "4px",
    textAlign: "center",
    color: "#fff",
    marginTop: 15,
    backgroundColor: "#783D6F",
    borderRadius: 4,
    cursor: "pointer"
  },
  error: {
    textAlign: "center",
    marginTop: 8,
    color: "red"
  }
};

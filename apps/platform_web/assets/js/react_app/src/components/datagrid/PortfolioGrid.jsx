import React from "react";

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
  deleteRow(idx) {
    console.log(idx);
    let holdings = [...this.state.holdings];
    holdings.splice(idx, 1);
    this.setState({ holdings });
  }
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
                            value={this.state.holdings[idx].holding}
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
                          value={this.state.holdings[idx].allocation}
                        />
                      </td>

                      <td className="has-input">
                        <span
                          className="icon"
                          onClick={i => this.deleteRow(idx)}
                          style={{ cursor: "pointer" }}
                        >
                          x<i className="fas fa-trash" />
                        </span>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
            <a class="button is-fullwidth is-primary is-outlined" onClick={this.addRow} >Add asset</a>
            <a class="button is-fullwidth is-link" onClick={this.handleSubmit} style={{marginTop: '10px'}}>Submit Portfolio</a>
          </form>
        </div>

        {this.state.error && <div style={styles.error}>{this.state.error}</div>}
      </div>
    );
  }
}

import React from "react";
import { Table, Select, Input } from "antd";
import tokens from "./MockData";
const Option = Select.Option;

const columns = [
  {
    title: "#",
    dataIndex: "key",
    key: "key",
    render: (text, record,i) => <a>{i +1}</a>
  },
  {
    title: "Holding",
    dataIndex: "holding",
    key: "holding",
    render: (token, record) => (
      <Select showSearch style={{ width: 200 }} placeholder="Select a Holding">
        {token.map((token, i) => (
          <Option value={token.holding}>{token.holding}</Option>
        ))}
      </Select>
    )
  },
  {
    title: "Allocation",
    dataIndex: "allocation",
    key: "allocation",
    render: () => <Input placeholder="Must be under 100" />
  },
  {
    title: "Action",
    key: "action",
    render: (text, record) => (
      <span>
        <a onClick={console.log(record)}>Delete</a>
      </span>
    )
  }
];

const data = [
  {
    key: "1",
    holding: tokens,
    allocation: null
  },
  {
    key: "2",
    holding: [tokens],
    allocation: null
  },
  {
    key: "3",
    holding: [tokens],
    allocation: null
  }
];

export default class PortfolioGrid extends React.Component {
  constructor() {
    super();
    this.state = {
      holdings: [{ holding: "", allocation: null }],
      noMoreRowInfo: false,
      noMoreAllocationInfo: false,
      totalWeight: 0
    };
    this.addRow = this.addRow.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  addRow = e => {
    if (data.length < 7) {
      this.setState(prevState => ({
        holdings: [...prevState.holdings, { holding: "", allocation: "" }]
      }));
      data.push({
        holding: tokens,
        allocation: null
      });
    } else {
      this.setState({ noMoreRowInfo: true });
      setTimeout(() => {
        this.setState({ noMoreRowInfo: false });
      }, 3000);
    }
  };
  handleSubmit = e => {
    e.preventDefault();
    let totalWeight = [];
    for (let i = 0; i < this.state.holdings.length; i++) {
      totalWeight.push(this.state.holdings[i].allocation);
    }
    totalWeight = totalWeight.reduce((a, b) => parseInt(a) + parseInt(b), 0);
    this.setState({ totalWeight });
    if (totalWeight >= 100) {
      this.setState({ noMoreAllocationInfo: true });
    }
  };
  handleChange = e => {
    if (["holding", "allocation"].includes(e.target.className)) {
      let holdings = [...this.state.holdings];
      holdings[e.target.dataset.id][e.target.className] = e.target.value;
      this.setState({ holdings });
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
    let { holdings, noMoreRowInfo, noMoreAllocationInfo } = this.state;
    return (
      <div>
        {noMoreRowInfo ? (
          <div className="notification is-info">
            <button
              className="delete"
              onClick={() => {
                this.setState({ noMoreRowInfo: false });
              }}
            />
            <p>Please choose less than 8.</p>
          </div>
        ) : null}
        {noMoreAllocationInfo ? (
          <div className="notification is-info">
            <button
              class="delete"
              onClick={() => {
                this.setState({ noMoreAllocationInfo: false });
              }}
            />
            <p>Please choose 100% or less.</p>
          </div>
        ) : null}
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
            <a
              className="button is-fullwidth is-primary is-outlined"
              onClick={this.addRow}
            >
              Add asset
            </a>
            <a
              className="button is-fullwidth is-link"
              onClick={this.handleSubmit}
              style={{ marginTop: "10px" }}
            >
              Submit Portfolio
            </a>
          </form>
        </div>
        <Table columns={columns} dataSource={data} />
        {this.state.error && <div style={styles.error}>{this.state.error}</div>}
      </div>
    );
  }
}

import React from "react";
import { Table, Select, Input, Button, Icon } from "antd";
import tokens from "./MockData";

const Option = Select.Option;

export default class PortfolioGrid extends React.Component {
  constructor() {
    super();
    this.state = {
      noMoreRowInfo: false,
      noMoreAllocationInfo: false,
      totalWeight: 0,
      tableData: [
        {
          holding: null,
          allocation: null
        }
      ],
      result: {}
    };
    this.addRow = this.addRow.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  addRow = e => {
    this.setState(prevState => ({
      tableData: [
        ...prevState.tableData,
        {
          holding: tokens,
          allocation: null
        }
      ]
      // holdings: [...prevState.holdings, { holding: "", allocation: "" }]
    }));
    // if (data.length < 7) {

    //   data.push({
    //     holding: tokens,
    //     allocation: null
    //   });
    // } else {
    //   this.setState({ noMoreRowInfo: true });
    //   setTimeout(() => {
    //     this.setState({ noMoreRowInfo: false });
    //   }, 3000);
    // }
  };
  handleSubmit = e => {
    e.preventDefault();
    console.log(this.state.tableData);
  };
  handleChange = e => {
    if (["holding", "allocation"].includes(e.target.id)) {
      let tableData = [...this.state.tableData];
      tableData[e.target.dataset.id][e.target.id] = e.target.value;
      this.setState({ tableData });
    } else {
      let tableData = [...this.state.tableData];
      tableData[e.target.dataset.id][e.target.id] = e.target.value;
      this.setState({ tableData });
    }
  };
  deleteRow(idx) {
    let data = [...this.state.tableData];
    data.splice(idx, 1);
    this.setState({ tableData: data });
  }
  render() {
    const columns = [
      {
        title: "#",
        dataIndex: "key",
        key: "key",
        render: (text, record, i) => <a>{i + 1}</a>
      },
      {
        title: "Holding",
        dataIndex: "holding",
        key: "holding",
        render: (token1, record, i) => (
          <select
            showSearch
            style={{ width: 200 }}
            placeholder="Select a Holding"
            id="holding"
            data-id={i}
          >
            {tokens.map((token, i) => (
              <option value={token.holding}>{token.holding}</option>
            ))}
          </select>
        )
      },
      {
        title: "Allocation",
        dataIndex: "allocation",
        key: "allocation",
        render: (token, record, i) => (
          <Input
            id="allocation"
            className="allocation"
            placeholder="Must be under 100"
            data-id={i}
          />
        )
      },
      {
        title: "Action",
        key: "action",
        render: (text, record, i) => (
          <Icon
            type="delete"
            theme="twoTone"
            style={{ cursor: "pointer" }}
            onClick={() => {
              this.deleteRow(i);
            }}
          />
        )
      }
    ];
    let { holdings, noMoreRowInfo, noMoreAllocationInfo } = this.state;
    return (
      <div>
        <div>
          Total Weight: <strong>{`${this.state.totalWeight}%`}</strong>
        </div>
        <form onSubmit={this.handleSubmit} onChange={this.handleChange}>
          <Table
            columns={columns}
            dataSource={this.state.tableData}
            pagination={false}
          />
          <Button type="secondary" onClick={this.addRow}>
            Add
          </Button>
          <Button type="primary" type="submit" onClick={this.addRow}>
            Submit
          </Button>
        </form>
        {this.state.error && <div style={styles.error}>{this.state.error}</div>}
      </div>
    );
  }
}

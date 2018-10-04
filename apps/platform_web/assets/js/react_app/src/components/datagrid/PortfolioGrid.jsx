import React from "react";
import { Table, Select, Input, Button, Icon } from "antd";
import tokens from "./MockData";

const Option = Select.Option;

export default class PortfolioGrid extends React.Component {
  constructor() {
    super();
    this.state = {
      holdings: [{ holding: "", allocation: null }],
      noMoreRowInfo: false,
      noMoreAllocationInfo: false,
      totalWeight: 0,
      tableData: [
        {
          holding: tokens,
          allocation: null
        },
        {
          holding: tokens,
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
    // e.preventDefault();
    // let totalWeight = [];
    // for (let i = 0; i < this.state.holdings.length; i++) {
    //   totalWeight.push(this.state.holdings[i].allocation);
    // }
    // totalWeight = totalWeight.reduce((a, b) => parseInt(a) + parseInt(b), 0);
    // this.setState({ totalWeight });
    // if (totalWeight >= 100) {
    //   this.setState({ noMoreAllocationInfo: true });
    // }
    console.log(this.state.result);
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
    let data = [...this.state.tableData];

    console.log(data.splice(idx, 1));
    console.log(data);
    this.setState({ tableData: data });

    // let holdings = [...this.state.holdings];
    // holdings.splice(idx, 1);
    // this.setState({ holdings });
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
        render: (token, record) => (
          <Select
            showSearch
            style={{ width: 200 }}
            placeholder="Select a Holding"
          >
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
        <Table
          columns={columns}
          dataSource={this.state.tableData}
          pagination={false}
        />
        <Button type="secondary" onClick={this.addRow}>
          Add
        </Button>
        <Button type="primary" onClick={this.addRow}>
          Submit
        </Button>
        {this.state.error && <div style={styles.error}>{this.state.error}</div>}
      </div>
    );
  }
}

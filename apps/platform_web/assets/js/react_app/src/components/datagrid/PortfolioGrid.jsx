import React from "react";
import { AgGridReact } from "ag-grid-react";
import "ag-grid/dist/styles/ag-grid.css";
import "ag-grid/dist/styles/ag-theme-balham-dark.css";
import update from "immutability-helper";
import SearchBarContainer from "../search/searchBarContainer";

import tokens from "./MockData";

const defaultTokens = [{ holding: "Select an asset", weight: 0 }];

export default class PortfolioGrid extends React.Component {
  constructor(props, context) {
    super(props);

    this.handleValueChange = this._handleValueChange.bind(this);
    this.validateInput = this._validateInput.bind(this);
    this.handleAddRow = this._handleAddRow.bind(this);
    this.handleSubmit = this._handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.myRef = React.createRef();
    this.state = {
      tokens: tokens,
      selectedHoldings: [],
      rows: [0, 1]
      // columnDefs: [
      //   {
      //     headerName: "Holding",
      //     field: "holding",
      //     editable: true,
      //     cellEditor: "agSelectCellEditor",
      //     singleClickEdit: true,
      //     cellEditorParams: { values: tokens.map(t => t["holding"]) }
      //   },
      //   {
      //     headerName: "Allocation",
      //     field: "weight",
      //     editable: true,
      //     singleClickEdit: true,
      //     onCellValueChanged: this.handleValueChange,
      //     valueSetter: this.validateInput
      //   }
      // ],
      // rowData: defaultTokens,
      // totalWeight: 0
    };
  }

  // The value setter function/method
  _validateInput(params) {
    // Value is legit - set it and signal the value has been changed/set
    const valToNumber = +params.newValue;

    if (!isNaN(valToNumber)) {
      params.data[params.colDef.field] = params.newValue;
      return true;
    }
    // Illegal value - signal no change
    return false;
  }

  _handleValueChange = () => {
    const { rowData } = this.state;

    const total = rowData.reduce(
      (prev, curr) => (prev += parseFloat(curr.weight)),
      0
    );
    this.setState({ totalWeight: total });
  };

  _handleAddRow = () => {
    const { rowData } = this.state;

    this.setState({
      rowData: [...rowData, { holding: "Select an asset", weight: 0 }]
    });
  };

  _handleSubmit = () => {
    if (this.state.totalWeight === 100) {
      /* SUBMIT FORM */
    } else {
      this.setState({ error: "Your total weight must equal 100%" });

      setTimeout(() => {
        this.setState({ error: null });
      }, 3000);
    }
  };
  handleChange(event) {
    this.setState(
      {
        ...this.state,
        selectedHoldings: [{ name: event.target.value }]
      },
      () => {
        var rows = this.state.rows;
        rows.push("new row");
        this.setState({ rows: rows });
      }
    );
  }
  deleteRow(i) {
    let rows = this.state.rows;
    rows.pop(i);
    this.setState({ rows: rows });
  }

  render() {
    let state = this.state;
    let token = state.tokens.map((t, i) => <option>{t.holding}</option>);
    return (
      <div>
        <div>
          Total Weight: <strong>{`${this.state.totalWeight}%`}</strong>
        </div>
        <div className="">
          <table className="table is-fullwidth is-bordered">
            <thead>
              <tr>
                <th>#</th>
                <th>Holding</th>
                <th>Allocation</th>
                <th />
              </tr>
            </thead>
            <tbody ref={this.myRef}>
              {state.rows.map((r, i) => (
                <tr>
                  <td>{i + 1}</td>
                  <td className="has-input">
                    <div className="select is-small">
                      <select onChange={this.handleChange}>{token}</select>
                    </div>
                  </td>
                  <td className="has-input">
                    <input className="input is-small" type="text" />
                  </td>

                  <td className="has-input">
                    <button onClick={i => this.deleteRow(i)}>del</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div onClick={this.handleAddRow} style={styles.addRowBtn}>
          Add another asset
        </div>
        <div onClick={this.handleSubmit} style={styles.submitBtn}>
          Submit Portfolio
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

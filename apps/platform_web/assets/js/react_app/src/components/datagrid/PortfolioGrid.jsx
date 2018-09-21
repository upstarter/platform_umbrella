import React from "react";
import { AgGridReact } from "ag-grid-react";
import "ag-grid/dist/styles/ag-grid.css";
import "ag-grid/dist/styles/ag-theme-balham-dark.css";
import update from "immutability-helper";
import SearchBarContainer from "../search/searchBarContainer";

import tokens from "./MockData";

const defaultTokens = [{ holding: "Select an asset", weight: 0 }];

export default class PortfolioGrid extends React.Component {
  // constructor(props, context) {
  //   super(props);

  //   this.handleValueChange = this._handleValueChange.bind(this);
  //   this.validateInput = this._validateInput.bind(this);
  //   this.handleSubmit = this._handleSubmit.bind(this);
  //   this.handleChange = this.handleChange.bind(this);
  //   this.myRef = React.createRef();
  //   this.state = {
  //     tokens: tokens,
  //     selectedHoldings: [],
  //     rows: [0, 1],
  //     totalWeight: 0,

  //   };
  // }

  // // The value setter function/method
  // _validateInput(params) {
  //   // Value is legit - set it and signal the value has been changed/set
  //   const valToNumber = +params.newValue;

  //   if (!isNaN(valToNumber)) {
  //     params.data[params.colDef.field] = params.newValue;
  //     return true;
  //   }
  //   // Illegal value - signal no change
  //   return false;
  // }

  // _handleValueChange = e => {
  //   // const { rowData } = this.state;

  //   // const total = rowData.reduce(
  //   //   (prev, curr) => (prev += parseFloat(curr.weight)),
  //   //   0
  //   // );
  //   // this.setState({ totalWeight: total });
  //   let value = parseInt(e.target.value);

  //   this.setState({ totalWeight: this.state.totalWeight + value });
  //   console.log();
  // };

  // _handleSubmit = () => {
  //   if (this.state.totalWeight === 100) {
  //     /* SUBMIT FORM */
  //   } else {
  //     this.setState({ error: "Your total weight must equal 100%" });

  //     setTimeout(() => {
  //       this.setState({ error: null });
  //     }, 3000);
  //   }
  // };
  // handleChange(event) {
  //   let value = event.target.value;
  //   this.setState({
  //     selectedHoldings: [...this.state.selectedHoldings, value]
  //   });
  //   var index = this.state.tokens
  //     .map(token => {
  //       return token.holding;
  //     })
  //     .indexOf(value);
  //   console.log(index);
  //   this.state.tokens.splice(index, 1);
  // }
  // deleteRow(i) {
  //   let rows = this.state.rows;
  //   rows.pop(i);
  //   this.setState({ rows: rows });
  // }

  constructor(props, context) {
    super(props);
    this.state = {
      tokens: tokens,
      shareholders: []
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleAddShareholder = this.handleAddShareholder.bind(this);
    this.handleShareholderNameChange = this.handleShareholderNameChange.bind(
      this
    );
    this.handleRemoveShareholder = this.handleRemoveShareholder.bind(this);
  }
  handleSubmit = evt => {
    const { name, shareholders } = this.state;
    alert(`Incorporated: ${name} with ${shareholders.length} shareholders`);
  };
  handleAddShareholder = () => {
    this.setState({
      shareholders: this.state.shareholders.concat([
        { name: "", allocation: null }
      ])
    });
  };
  handleShareholderNameChange = e => {
    // const newShareholders = this.state.shareholders.map((shareholder, sidx) => {
    //   // if (idx !== sidx) return shareholder;
    //   return { ...shareholder, name: evt.target.value };
    // });

    // this.setState({ shareholders: newShareholders });

    let tokenId = e.target.value;
    this.setState({
      shareholders: this.state.shareholders.concat([
        { tokenId, name: this.state.tokens[tokenId].holding }
      ])
    });
  };
  handleRemoveShareholder = idx => e => {
    this.setState({
      shareholders: this.state.shareholders.filter((s, sidx) => idx !== sidx)
    });
  };
  handleAllocationChange = id => e => {
    let shareholder = this.state.shareholders[id];
    console.log(this.state.shareholders[id + 1], e);
  };
  render() {
    let state = this.state;
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
              {state.shareholders.map((shareholder, i) => (
                <tr>
                  <td>{i + 1}</td>
                  <td className="has-input">
                    <div className="select is-small">
                      <select
                        onChange={e => this.handleShareholderNameChange(e)}
                      >
                        <option value={null}>"Choose"</option>
                        {state.tokens.map((t, i) => (
                          <option value={t.id}>{t.holding}</option>
                        ))}
                      </select>
                    </div>
                  </td>
                  <td className="has-input">
                    <input
                      className="input is-small"
                      type="text"
                      value={shareholder.allocation}
                      onChange={(id, e) => this.handleAllocationChange(i, e)}
                    />
                  </td>
                  <td onClick={this.handleRemoveShareholder(shareholder.id)}>
                    x
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <button onClick={this.handleAddShareholder}>Add </button>
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

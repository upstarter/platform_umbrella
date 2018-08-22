import React from 'react'
import { AgGridReact } from 'ag-grid-react'
import 'ag-grid/dist/styles/ag-grid.css'
import 'ag-grid/dist/styles/ag-theme-balham-dark.css'
import update from 'immutability-helper'
import SearchBar from '../search/searchBarContainer'

import tokens from './MockData'

const defaultTokens = [{ holding: 'Select an asset', weight: 0 }]

export default class PortfolioGrid extends React.Component {
  constructor(props, context) {
    super(props)

    this.handleValueChange = this._handleValueChange.bind(this)
    this.validateInput = this._validateInput.bind(this)
    this.handleAddRow = this._handleAddRow.bind(this)
    this.handleSubmit = this._handleSubmit.bind(this)

    this.state = {
      columnDefs: [
        {
          headerName: 'Holding',
          field: 'holding',
          editable: true,
          cellEditor: 'agSelectCellEditor',
          singleClickEdit: true,
          cellEditorParams: { values: tokens.map(t => t['holding']) }
        },
        {
          headerName: 'Allocation',
          field: 'weight',
          editable: true,
          singleClickEdit: true,
          onCellValueChanged: this.handleValueChange,
          valueSetter: this.validateInput
        }
      ],
      rowData: defaultTokens,
      totalWeight: 0
    }
  }

  // The value setter function/method
  _validateInput(params) {
    // Value is legit - set it and signal the value has been changed/set
    const valToNumber = +params.newValue

    if (!isNaN(valToNumber)) {
      params.data[params.colDef.field] = params.newValue
      return true
    }
    // Illegal value - signal no change
    return false
  }

  _handleValueChange = () => {
    const { rowData } = this.state

    const total = rowData.reduce(
      (prev, curr) => (prev += parseFloat(curr.weight)),
      0
    )
    this.setState({ totalWeight: total })
  }

  _handleAddRow = () => {
    const { rowData } = this.state

    this.setState({
      rowData: [...rowData, { holding: 'Select an asset', weight: 0 }]
    })
  }

  _handleSubmit = () => {
    if (this.state.totalWeight === 100) {
      /* SUBMIT FORM */
    } else {
      this.setState({ error: 'Your total weight must equal 100%' })

      setTimeout(() => {
        this.setState({ error: null })
      }, 3000)
    }
  }

  render() {
    return (
      <div>
        <div>
          Total Weight: <strong>{`${this.state.totalWeight}%`}</strong>
        </div>
        <div
          className="ag-theme-balham-dark"
          style={{ width: 402, height: 400 }}
        >
          <AgGridReact
            columnDefs={this.state.columnDefs}
            rowData={this.state.rowData}
            ref="grid"
          />
        </div>
        <div onClick={this.handleAddRow} style={styles.addRowBtn}>
          Add another asset
        </div>
        <div onClick={this.handleSubmit} style={styles.submitBtn}>
          Submit Portfolio
        </div>
        {this.state.error && <div style={styles.error}>{this.state.error}</div>}
      </div>
    )
  }
}

const styles = {
  addRowBtn: {
    width: '100%',
    fontSize: 16,
    padding: '4px',
    textAlign: 'center',
    color: '#222',
    marginTop: 15,
    border: '1px solid #783D6F',
    borderRadius: 4,
    cursor: 'pointer'
  },
  submitBtn: {
    width: '100%',
    fontSize: 16,
    padding: '4px',
    textAlign: 'center',
    color: '#fff',
    marginTop: 15,
    backgroundColor: '#783D6F',
    borderRadius: 4,
    cursor: 'pointer'
  },
  error: {
    textAlign: 'center',
    marginTop: 8,
    color: 'red'
  }
}

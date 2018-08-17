import React from 'react'
import ReactDataGrid from 'react-data-grid'
import { Editors, Toolbar, Formatters } from 'react-data-grid-addons'
import faker from 'faker'
import update from 'immutability-helper'

const { AutoComplete: AutoCompleteEditor, DropDownEditor } = Editors
const { ImageFormatter } = Formatters

faker.locale = 'en_GB'

export default class DataGridComponent extends React.Component {
  constructor(props, context) {
    super(props, context)
    this._columns = [
      { key: 'id', name: 'ID', width: 80, resizable: false },
      {
        key: 'assetLogo',
        name: 'Logo',
        width: 60,
        formatter: ImageFormatter,
        resizable: false,
        headerRenderer: <ImageFormatter value={faker.image.cats()} />
      },
      {
        key: 'assetType',
        name: 'Asset Type',
        editor: <AutoCompleteEditor options={assets} />,
        width: 400,
        resizable: true
      },
      {
        key: 'weight',
        name: 'Weight',
        width: 300,
        resizable: true,
        events: {
          onDoubleClick: function() {
            console.log('The user double clicked on title column')
          }
        }
      }
    ]

    this.createRows = this._createRows.bind(this)
    this.createFakeRowObjectData = this._createFakeRowObjectData.bind(this)
    this.getSize = this._getSize.bind(this)
    this.getColumns = this._getColumns.bind(this)
    this.handleGridRowsUpdated = this._handleGridRowsUpdated.bind(this)
    this.handleAddRow = this._handleAddRow.bind(this)
    this.getRowAt = this._getRowAt.bind(this)

    this.state = { rows: this.createRows(8) }
  }

  _createRows(numberOfRows) {
    let rows = []
    for (let i = 0; i < numberOfRows; i++) {
      rows[i] = this.createFakeRowObjectData(i)
    }
    return rows
  }

  _createFakeRowObjectData(index) {
    return {
      id: 'id_' + index,
      assetLogo: faker.image.avatar(),
      assetType: assets[index].title
    }
  }

  _getColumns() {
    let clonedColumns = this._columns.slice()
    clonedColumns[2].events = {
      onClick: (ev, args) => {
        const idx = args.idx
        const rowIdx = args.rowIdx
        this.grid.openCellEditor(rowIdx, idx)
      }
    }

    return clonedColumns
  }

  _handleGridRowsUpdated({ fromRow, toRow, updated }) {
    let rows = this.state.rows.slice()

    for (let i = fromRow; i <= toRow; i++) {
      let rowToUpdate = rows[i]
      let updatedRow = update(rowToUpdate, { $merge: updated })
      rows[i] = updatedRow
    }

    this.setState({ rows })
  }

  _handleAddRow({ newRowIndex }) {
    const newRow = {
      value: newRowIndex,
      userStory: '',
      developer: '',
      epic: ''
    }

    let rows = this.state.rows.slice()
    rows = update(rows, { $push: [newRow] })
    this.setState({ rows })
  }

  _getRowAt(index) {
    if (index < 0 || index > this.getSize()) {
      return undefined
    }

    return this.state.rows[index]
  }

  _getSize() {
    return this.state.rows.length
  }

  render() {
    return (
      <ReactDataGrid
        ref={node => (this.grid = node)}
        enableCellSelect={true}
        columns={this.getColumns()}
        rowGetter={this.getRowAt}
        rowsCount={this.getSize()}
        onGridRowsUpdated={this.handleGridRowsUpdated}
        toolbar={<Toolbar onAddRow={this.handleAddRow} />}
        enableRowSelect={true}
        rowHeight={50}
        minHeight={600}
        rowScrollTimeout={200}
      />
    )
  }
}

const assets = [
  { id: 0, title: 'Ethereum' },
  { id: 1, title: 'Bitcoin' },
  { id: 2, title: 'Bitcoin Cash' },
  { id: 3, title: 'PowerLedger' },
  { id: 4, title: 'Storj' },
  { id: 5, title: 'Peercoin' },
  { id: 6, title: 'Streamr DATAcoin' },
  { id: 7, title: 'PotCoin' },
  { id: 8, title: 'Santiment' }
]

import React from 'react';
import ReactDataGrid from 'react-data-grid';
const { Editors, Toolbar, Formatters } = require('react-data-grid-addons');
import update from 'immutability-helper';
const { AutoComplete: AutoCompleteEditor, DropDownEditor } = Editors;


const tokens = [
  { id: 0, title: 'ETH'},
  { id: 1, title: 'REP'},
  { id: 2, title: 'STEEM'},
  { id: 3, title: 'BTC'},
  { id: 4, title: 'GNT'},
  { id: 5, title: 'SJCX'},
  { id: 6, title: 'SC'},
  { id: 7, title: 'XMR'},
  { id: 8, title: 'DGD'},
  { id: 9, title: 'AMP'},
  { id: 10, title: 'FCT'},
];

const allocations = ['2.5%', '5%', '10%', '15%', '20%'];

export default class PortfolioGrid extends React.Component {
  constructor(props, context) {
    super(props, context);
    this._columns = [
      {
        key: 'id',
        name: 'ID',
        width: 80,
      },
      {
        key: 'token',
        name: 'Token',
        editor: <AutoCompleteEditor options={tokens}/>,
        width: 200
      },
      {
        key: 'weight',
        name: 'Weight',
        editor: <DropDownEditor options={allocations}/>,
        width: 200,

      },
    ];

    this.state = { rows: this.createRows(20) };
  }

  createRows = (numberOfRows) => {
    let rows = [];
    for (let i = 0; i < numberOfRows; i++) {
      rows[i] = this.createFakeRowObjectData(i);
    }
    return rows;
  }

  createFakeRowObjectData = (index) => {
    return {
      id: 'id_' + index,
      token: 'ETH',
      weight: '20%',
    };
  };

  getColumns = () => {
    let clonedColumns = this._columns.slice();
    clonedColumns[1].events = {
      onClick: (ev, args) => {
        const idx = args.idx;
        const rowIdx = args.rowIdx;
        this.grid.openCellEditor(rowIdx, idx);
      }
    };

    return clonedColumns;
  };

  handleGridRowsUpdated = ({ fromRow, toRow, updated }) => {
    let rows = this.state.rows.slice();

    for (let i = fromRow; i <= toRow; i++) {
      let rowToUpdate = rows[i];
      let updatedRow = update(rowToUpdate, {$merge: updated});
      rows[i] = updatedRow;
    }

    this.setState({ rows });
  };

  handleAddRow = ({ newRowIndex })  => {
    const newRow = {
      value: newRowIndex,
      userStory: '',
      developer: '',
      epic: ''
    };

    let rows = this.state.rows.slice();
    rows = update(rows, {$push: [newRow]});
    this.setState({ rows });
  };

  getRowAt = (index) => {
    if (index < 0 || index > this.getSize()) {
      return undefined;
    }

    return this.state.rows[index];
  };

  getSize = (e) => {
    return this.state.rows.length;
  };

  render() {
    return (
      <ReactDataGrid
        ref={ node => this.grid = node }
        enableCellSelect={true}
        columns={this.getColumns()}
        rowGetter={this.getRowAt}
        rowsCount={this.getSize()}
        onGridRowsUpdated={this.handleGridRowsUpdated}
        toolbar={<Toolbar onAddRow={this.handleAddRow}/>}
        enableRowSelect={true}
        rowHeight={50}
        minHeight={600}
        rowScrollTimeout={200} />);
  }
}

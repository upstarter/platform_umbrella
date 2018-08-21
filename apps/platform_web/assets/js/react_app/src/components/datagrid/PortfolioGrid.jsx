import React from 'react';
import {AgGridReact} from 'ag-grid-react';
import 'ag-grid/dist/styles/ag-grid.css';
import 'ag-grid/dist/styles/ag-theme-balham-dark.css';
import update from 'immutability-helper';


const tokens = [
  { holding: 'ETH', weight: 0 },
  { holding: 'REP', weight: 1 },
  { holding: 'STEEM', weight: 2 },
  { holding: 'BTC', weight: 3 },
  { holding: 'GNT', weight: 4 },
  { holding: 'SJCX', weight: 5 },
  { holding: 'SC', weight: 6 },
  { holding: 'XMR', weight: 7 },
  { holding: 'DGD', weight: 8 },
  { holding: 'AMP', weight: 9 },
  { holding: 'FCT', weight: 10 },
];

const allocations = ['2.5%', '5%', '10%', '15%', '20%'];

export default class PortfolioGrid extends React.Component {
	constructor(props, context) {
		super(props);

		this.state = {
			columnDefs: [
				{
          headerName: "Hodling (Asset)",
          field: "holding",
          editable: true,
          cellEditor: 'agSelectCellEditor',
          singleClickEdit: true,
          cellEditorParams: {
            values: [
              'ETH','REP','STEEM',
              'BTC','GNT','SJCX',
              'SC','XMR','DGD',
              'AMP','FCT'
            ]
          }
        },
				{
          headerName: "Weight",
          field: "weight",
          editable: true,
          singleClickEdit: true
        }
			],
			rowData: tokens
		}
	}


	render() {
		return (
			<div
				className="ag-theme-balham-dark"
				style={{
					height: '400px',
					width: '402px'
				}}
			>
				<AgGridReact
					columnDefs={this.state.columnDefs}
					rowData={this.state.rowData}>
				</AgGridReact>
			</div>
		);
	}

}

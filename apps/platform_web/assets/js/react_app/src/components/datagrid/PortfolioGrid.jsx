import React from 'react';
import {AgGridReact} from 'ag-grid-react';
import 'ag-grid/dist/styles/ag-grid.css';
import 'ag-grid/dist/styles/ag-theme-balham-dark.css';
import update from 'immutability-helper';


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
            values: ['EOS', 'ETH', 'ADA', 'ZRX', 'BTC']
          }
        },
				{
          headerName: "Weight",
          field: "weight",
          editable: true,
          singleClickEdit: true
        }
			],
			rowData: [
				{holding: "ETH", weight: 50},
				{holding: "EOS", weight: 25},
				{holding: "ADA", weight: 25}
			]
		}
	}


	render() {
		return (
			<div
				className="ag-theme-balham-dark"
				style={{
					height: '500px',
					width: '300px'
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

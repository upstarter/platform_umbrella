import React from 'react';
import {AgGridReact} from 'ag-grid-react';
import 'ag-grid/dist/styles/ag-grid.css';
import 'ag-grid/dist/styles/ag-theme-balham-dark.css';
import update from 'immutability-helper';


const tokens = [
  { holding: 'ETH (Ethereum)', weight: 0 },
  { holding: 'REP (Augur)', weight: 1 },
  { holding: 'ICN (Iconomi)', weight: 6 },
  { holding: 'STEEM (Steemit)', weight: 2 },
  { holding: 'BTC (Bitcoin)', weight: 3 },
  { holding: 'GNT (Golem)', weight: 4 },
  { holding: 'SJCX (Storj)', weight: 5 },
  { holding: 'SC (Sia)', weight: 6 },
  { holding: 'XMR (Monero)', weight: 7 },
  { holding: 'DGD (DigixDao)', weight: 8 },
  { holding: 'AMP (Synerio)', weight: 9 },
  { holding: 'FCT (Factom)', weight: 10 },
];

 const empties = [...Array(1)].map((_, i) => {
   return {holding: 'Select an asset', weight: 'Weight: 1 to 100%' };f
 });
console.log(empties);
const defaultTokens = [tokens[0]].concat(empties);
console.log(defaultTokens);
export default class PortfolioGrid extends React.Component {
	constructor(props, context) {
		super(props);

		this.state = {
			columnDefs: [
				{
          headerName: "Hodling",
          field: "holding",
          editable: true,
          cellEditor: 'agSelectCellEditor',
          singleClickEdit: true,
          cellEditorParams: {
            values: tokens.map(t => t['holding'] )
          }
        },
				{
          headerName: "Allocation",
          field: "weight",
          editable: true,
          singleClickEdit: true
        }
			],
			rowData: defaultTokens
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

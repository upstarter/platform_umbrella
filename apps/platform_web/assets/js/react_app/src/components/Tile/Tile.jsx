import React, { Component } from "react";
import injectSheet from "react-jss";
import { Card } from 'antd';

const styles = {
  card: {
    fontSize: '12px',
    maxWidth: '200px',
    cursor: "pointer"
  }
};

class TileUnstyled extends Component {
  constructor(props) {
    super(props);
    this.handleSelected = this.handleSelected.bind(this);
    this.state = {
      selected: false
    };
  }
  componentDidMount() {
    if (this.props.selectedIds.includes(this.props.id)) {
      this.setState({ selected: true });
    }
  }

  handleSelected(id) {
    let currentState = this.state.selected;
    this.setState({ selected: !currentState });
    if (this.state.selected) {
      this.props.removeTopicKnowledgeIds(id);
    } else {
      this.props.collectTopicKnowledgeIds(id);
    }
  }
  render() {
    let props = this.props;
    let data = props.data;
    let classes = props.classes;
    let state = this.state;
    // console.log(data.id);
    // console.log("ids", props.selectedIds);
    return (
       <Card
         bordered={true}
         className={`${classes.card}`}
         style={state.selected ? { background: "#783D6F" } : null}
         onClick={id => this.handleSelected(data.id)}
        >
          <div className="card-content">
            <p
              className="subtitle"
              style={state.selected ? { color: "white" } : null}
            >
              {data.name}
            </p>
          </div>
       </Card>


    );
  }
}

const Tile = injectSheet(styles)(TileUnstyled);
export default Tile;

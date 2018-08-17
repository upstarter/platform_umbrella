import React, { Component } from "react";
import injectSheet from "react-jss";

const styles = {
  tile: {
    width: "100%",
    height: "100%",
    backgroundColor: "red"
  },
  title: {
    color: "white"
  }
};

class TileUnstyled extends Component {
  constructor() {
    super();
    this.handleSelected = this.handleSelected.bind(this);
    this.state = {
      selected: false
    };
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
    let classes = props.classes;
    let state = this.state;
    return (
      <div
        className={classes.tile}
        onClick={() => this.handleSelected(props.id)}
      >
        <input type="checkbox" id="check01" name="check" value="1" />
        <label for="check01" className="radio" />
        <div className="check-card-bg" />
        <div className="check-card-body">
          <div className="check-card-toggle">
            <span />
            <span />
          </div>
          <div className="check-card-body-in">
            <h3 className="check-card-title">props.title</h3>
            {/* <p className="check-card-description">Card item description</p> */}
          </div>
          {state.selected ? (
            <div className="check-card-cancel">selected</div>
          ) : null}
        </div>
      </div>
    );
  }
}

const Tile = injectSheet(styles)(TileUnstyled);
export default Tile;

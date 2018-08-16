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
  render() {
    let props = this.props;
    let classes = props.classes;
    return (
      <div className={classes.tile}>
        <img src="" alt="" />
        <h3 className={classes.title}>props.title</h3>
      </div>
    );
  }
}

const Tile = injectSheet(styles)(TileUnstyled);
export default Tile;

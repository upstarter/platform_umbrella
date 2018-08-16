import React, { Component } from "react";
import injectSheet from "react-jss";
import Tile from "../../components/Tile/Tile";

const styles = {
  container: {
    height: "100%",
    display: "flex",
    flexDirection: "column",
    justifyContent: "space-between"
  },
  header: {
    backgroundColor: "#373A40",
    height: "220px",
    width: "100%",
    padding: "8.5em 15em 0 15em",
    lineHeight: '4.5em'
  },
  title: {
    fontSize: "32px",
    color: "white",
    textAlign: "center"
  },
  main: {
    padding: "1em 15em"
  },
  tileGrid: {
    display: "grid",
    gridTemplateColumns: "repeat(6, 100px)",
    gridTemplateRows: "repeat(3, 100px)",
    gridColumnGap: "1em",
    gridRowGap: "1em"
  }
};

class Step1Unstyled extends Component {
  constructor(props) {
    super(props);
    this._validate = this._validate.bind(this);
    // Bindings for form fields would go here,
    // and state would keep track of field input
  }
  _validate() {
    // a sanitized version of state can be passed instead
    this.props.afterValid(this.state);
  }
  render() {
    let props = this.props;
    let classes = props.classes;
    if (props.currentStep !== 1) {
      return null;
    }
    let Tiles = [];
    for (let i = 0; i < 18; i++) {
      Tiles.push(<Tile />);
    }
    return (
      <div className={classes.container}>
        <div className={classes.header}>
          <h2 className={classes.title}>
            Which of these topics do you know the most about?
          </h2>
        </div>
        <div className={classes.main}>
          <div className={classes.tileGrid}>{Tiles}</div>
        </div>
        <div className={classes.main}>
          <button
            className="button is-primary is-rounded"
            onClick={() => this.props.prev()}
          >
            Back
          </button>
          <button
            className="button is-primary is-rounded"
            onClick={this._validate}
          >
            Next
          </button>
        </div>
      </div>
    );
  }
}

const Step1 = injectSheet(styles)(Step1Unstyled);
export default Step1;

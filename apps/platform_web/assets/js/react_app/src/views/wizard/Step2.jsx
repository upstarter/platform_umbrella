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
    lineHeight: "4.5em"
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

class Step2Unstyled extends Component {
  constructor(props) {
    super(props);
    this._validate = this._validate.bind(this);
    // Bindings for form fields would go here,
  }
  _validate() {
    this.props.afterValid(this.state);
  }
  render() {
    let props = this.props;
    let classes = props.classes;
    if (props.currentStep !== 2) {
      return null;
    }
    let tiles = this.props.topics
      ? props.topics.map((data, i) => {
          return <Tile title={data.name} key={i} />;
        })
      : [];
    return (
      <div className={classes.container}>
        <div className={classes.header}>
          <h2 className={classes.title}>
          Which of these topics do you most want to learn about?          </h2>
        </div>
        <div className={classes.main}>
          <div className={classes.tileGrid}>{tiles}</div>
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

const Step2 = injectSheet(styles)(Step2Unstyled);
export default Step2;

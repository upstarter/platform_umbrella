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

class Step1Unstyled extends Component {
  constructor(props) {
    super(props);
    this._validate = this._validate.bind(this);
    // Bindings for form fields would go here,
    this.state = {
      topic_knowledge_ids: []
    };
  }
  _validate() {
    this.props.afterValid(this.state);
  }
  collectTopicKnowledgeIds(id) {
    console.log("collectTopicKnowledgeIds", id);
    this.setState(
      {
        topic_knowledge_ids: [...this.state.topic_knowledge_ids, id]
      },
      console.log("step1state:", this.state)
    );
  }
  removeTopicKnowledgeIds(id) {
    console.log("filter", id);
    let state = this.state;
    let i = state.topic_knowledge_ids.indexOf(id);
    console.log("post", i);
    if (i != -1) {
      state.topic_knowledge_ids.splice(i, 1);
    }
  }
  render() {
    let props = this.props;
    let classes = props.classes;
    if (props.currentStep !== 1) {
      return null;
    }
    let tiles = this.props.topics
      ? props.topics.map((data, i) => {
          return (
            <Tile
              title={data.name}
              key={data.id}
              id={data.id}
              removeTopicKnowledgeIds={id => this.removeTopicKnowledgeIds(id)}
              collectTopicKnowledgeIds={id => this.collectTopicKnowledgeIds(id)}
            />
          );
        })
      : [];
    return (
      <div className={classes.container}>
        <div className={classes.header}>
          <h2 className={classes.title}>
            Which of these topics do you know the most about?
          </h2>
        </div>
        <div className={classes.main}>
          <div className={classes.tileGrid}>{tiles}</div>
        </div>
        <div className={classes.main}>
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

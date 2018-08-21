import React, { Component } from "react";
import injectSheet from "react-jss";
import Tile from "../../components/Tile/Tile";

const styles = {
  container: {
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
    gridTemplateColumns: "repeat(4, 1fr)",
    // gridTemplateRows: "repeat(3, auto)",
    gridColumnGap: "1em",
    gridRowGap: "1em"
  },
  "@media (max-width: 768px)": {
    tileGrid: {
      gridTemplateColumns: "1fr 1fr 1fr"
    },
    main: {
      padding: "1em 1em"
    }
  },
  "@media (max-width: 414px)": {
    tileGrid: {
      gridTemplateColumns: "1fr 1fr"
    },
    main: {
      padding: "1em 1em"
    },
    header: {
      padding: "2em 5em",
      height: "110px",
      lineHeight: "3em"
    },
    title: {
      fontSize: "20px"
    }
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
    if (this.state.topic_knowledge_ids.length >= 3) {
      this.props.saveForm(this.state.topic_knowledge_ids);
      this.props.afterValid(this.state);
      return;
    }
    alert("Choose at least 3.");
  }
  collectTopicKnowledgeIds(id) {
    this.setState({
      topic_knowledge_ids: [...this.state.topic_knowledge_ids, id]
    });
  }
  removeTopicKnowledgeIds(id) {
    let state = this.state;
    let i = state.topic_knowledge_ids.indexOf(id);
    if (i != -1) {
      state.topic_knowledge_ids.splice(i, 1);
    }
  }
  collectTopicKnowledgeIds(id) {
    this.setState({
      topic_knowledge_ids: [...this.state.topic_knowledge_ids, id]
    });
  }
  removeTopicKnowledgeIds(id) {
    let state = this.state;
    let i = state.topic_knowledge_ids.indexOf(id);
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
              data={data}
              key={i}
              id={data.id}
              removeTopicKnowledgeIds={id => this.removeTopicKnowledgeIds(id)}
              collectTopicKnowledgeIds={id => this.collectTopicKnowledgeIds(id)}
              selectedIds={props.selectedIds}
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
            style={{ float: "right" }}
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

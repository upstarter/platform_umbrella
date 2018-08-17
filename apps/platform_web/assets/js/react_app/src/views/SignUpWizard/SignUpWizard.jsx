import React, { Component } from "react";
import Step1 from "./Step1";
import Step2 from "./Step2";
import Step3 from "./Step3";
import Step4 from "./Step4";

export default class SignUpWizard extends Component {
  constructor() {
    super();
    this.state = {
      currentStep: 1,
      name: null,
      email: null,
      password: null,
      topic_knowledge_ids: null,
      topic_interest_ids: null
    };
    this._next = this._next.bind(this);
    this._prev = this._prev.bind(this);
    this._saveKnowledgeIds = this._saveKnowledgeIds.bind(this);
    this._saveinterestIds = this._saveinterestIds.bind(this);
  }
  _saveKnowledgeIds(array) {
    this.setState({
      topic_knowledge_ids: array
    });
  }
  _saveinterestIds(array) {
    this.setState({
      topic_interest_ids: array
    });
  }
  _next() {
    let currentStep = this.state.currentStep;
    // Make sure currentStep is set to something reasonable
    if (currentStep >= 3) {
      currentStep = 4;
    } else {
      currentStep = currentStep + 1;
    }

    this.setState({
      currentStep: currentStep
    });
  }
  _prev() {
    let currentStep = this.state.currentStep;
    if (currentStep <= 1) {
      currentStep = 1;
    } else {
      currentStep = currentStep - 1;
    }

    this.setState({
      currentStep: currentStep
    });
  }

  render() {
    let state = this.state;
    return (
      <div style={{ height: "100%" }}>
        <Step1
          currentStep={state.currentStep}
          afterValid={this._next}
          topics={this.props.topics}
          saveForm={this._saveKnowledgeIds}
        />
        <Step2
          currentStep={state.currentStep}
          afterValid={this._next}
          prev={() => this._prev()}
          topics={this.props.topics}
          saveForm={this._saveinterestIds}
        />
        <Step3
          currentStep={state.currentStep}
          afterValid={this._next}
          prev={() => this._prev()}
        />
        <Step4
          currentStep={state.currentStep}
          afterValid={this._next}
          prev={() => this._prev()}
        />
      </div>
    );
  }
}

import React, { Component } from "react";
import Step1 from "../../views/wizard/Step1";
import Step2 from "../../views/wizard/Step2";
import Step3 from "../../views/wizard/Step3";
import Step4 from "../../views/wizard/Step4";

export default class SignUpWizard extends Component {
  constructor() {
    super();
    this.state = {
      currentStep: 1
    };
    this._next = this._next.bind(this);
    this._prev = this._prev.bind(this);
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
      <div>
        {this.state.currentStep}
        <Step1 currentStep={state.currentStep} />
        <Step2 currentStep={state.currentStep} />
        <Step3 currentStep={state.currentStep} />
        <Step4 currentStep={state.currentStep} />
        <button className="button" onClick={this._prev}>Prev</button>
        <button className="button" onClick={this._next}>Next</button>
      </div>
    );
  }
}

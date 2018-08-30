import React, { Component } from "react";

export default class NextButton extends Component {
  render() {
    let state = this.state;
    let props = this.props;
    return (
      <div>
        <a
          className={`${props.disabled ? "Disabled" : ""} button is-link`}
          disabled
        >
          Disabled
        </a>
      </div>
    );
  }
}

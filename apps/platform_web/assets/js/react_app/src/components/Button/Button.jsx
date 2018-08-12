import React, { Component } from "react";

export default class Button extends Component {
  render() {
    let props = this.props;
    return (
      <button
        className={`button ${props.className}`}
        onClick={props.onClick}
      >
        {props.children}
      </button>
    );
  }
}

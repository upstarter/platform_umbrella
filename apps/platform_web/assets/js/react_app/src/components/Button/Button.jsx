import React, { Component } from "react";

export default class Button extends Component {
  render() {
    let props = this.props
    return (
      <div>
        <button className={`button ${props.className}`}>{props.children}</button>
      </div>
    );
  }
}

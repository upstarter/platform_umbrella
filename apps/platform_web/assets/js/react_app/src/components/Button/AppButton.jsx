import React, { Component } from "react";
import { Button, Radio, Icon } from 'antd';

export default class AppButton extends Component {
  render() {
    let props = this.props;
    return (
      <Button
        type={props.type}
        icon={props.icon}
        size={props.size}
        className={props.className}
        onClick={props.onClick}
      >
        {props.children}
      </Button>
    );
  }
}

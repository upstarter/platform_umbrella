import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import { Layout, Menu, Icon } from 'antd';
const { Sider } = Layout;
import LinkMenu from './LinkMenu'
import injectSheet, { jss } from "react-jss"

const SiderMenu = withRouter(props => {
  const { location } = props;
  const { classes } = props;
  return (
    <Sider
      breakpoint="lg"
      collapsedWidth="0"
      onBreakpoint={(broken) => { console.log(broken); }}
      onCollapse={(collapsed, type) => { console.log(collapsed, type); }}
    >
      <LinkMenu />
    </Sider>
  );
});

const siderMenuStyles = {
  sider: {
  }
}

export default injectSheet(siderMenuStyles)(SiderMenu);

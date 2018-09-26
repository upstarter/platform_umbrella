import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import { Layout } from 'antd';
const { Sider } = Layout;
import LinkMenu from './LinkMenu'
import injectSheet, { jss } from "react-jss"

const SiderMenu = withRouter(props => {
  const { location } = props;
  const { classes } = props;
  return (
    <Sider
      className={classes.sider}
      breakpoint="sm"
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
    position: 'fixed',
    zIndex: 1,
    height: '100vh'
  }
}

export default injectSheet(siderMenuStyles)(SiderMenu);

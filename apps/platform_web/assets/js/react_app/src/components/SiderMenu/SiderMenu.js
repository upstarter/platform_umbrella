import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import { Layout } from 'antd';
const { Sider } = Layout;
import LinkMenu from './LinkMenu'
import injectSheet, { jss } from "react-jss"
import nav_logo from "../../../../../static/images/nav_logo.svg";

const SiderMenu = withRouter(props => {
  const { location } = props;
  const { classes } = props;
  return (
    <Sider
      className={classes.sider}
      breakpoint="md"
      collapsedWidth="0"
      collapsible="true"
      onBreakpoint={(broken) => { console.log(broken); }}
      onCollapse={(collapsed, type) => { console.log(collapsed, type); }}
    >
      <div className={classes.logo}>
        <img src={nav_logo} />
      </div>
      <LinkMenu />
    </Sider>
  );
});

const siderMenuStyles = {
  sider: {

    zIndex: 1,
    height: '100%'
  }
}

export default injectSheet(siderMenuStyles)(SiderMenu);

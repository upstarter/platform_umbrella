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
      breakpoint="sm"
      collapsedWidth="0"
      collapsible="true"
      onBreakpoint={(broken) => { console.log(broken); }}
      onCollapse={(collapsed, type) => { console.log(collapsed, type); }}
    >
      <Link to="/">
        <div className={classes.logo} style={{padding: '14px 14px 0 14px'}}>
            <img src={nav_logo} />
        </div>
      </Link>
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

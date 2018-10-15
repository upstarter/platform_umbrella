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
      collapsedWidth="80"
      collapsible
      style={{ overflow: 'visible', height: '100vh', position: 'fixed', zIndex: 2, left: 0 }}
      onBreakpoint={(broken) => { console.log(broken); }}
      onCollapse={
        (collapsed, type) =>
          { collapsed ? props.setContentMarginLeft('0px') : props.setContentMarginLeft('200px') }
      }
    >
      <Link to="/">
        <div style={{padding: '14px 14px 0 14px'}}>
            <img className={classes.logo} src={nav_logo} />
        </div>
      </Link>
      <LinkMenu />
    </Sider>
  );
});

const siderMenuStyles = {
  sider: {

  },
  logo: {
    '@media (max-width: 576px)': {
      marginLeft: '32px',
    },
  }
}

export default injectSheet(siderMenuStyles)(SiderMenu);

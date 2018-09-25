import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import { Menu, Icon } from 'antd';
import injectSheet, { jss } from "react-jss"


const LinkMenu = withRouter(props => {
  const { location } = props;
  const { classes } = props;
  return (
    <Menu className={classes.menu} theme="dark" mode="inline" selectedKeys={[location.pathname]} defaultSelectedKeys={["/portfolio"]}>
      <Menu.Item key="/">
        <Icon type="user" />
        <span className="nav-text">
          <Link to="/">
            Porfolio
          </Link>
        </span>

      </Menu.Item>
      <Menu.Item key="/contribute">
        <Icon type="user" />
        <span className="nav-text">
          <Link to="/contribute">
            Analysis
          </Link>
        </span>
      </Menu.Item>
      <Menu.Item key="/investors">
        <Icon type="user" />
        <span className="nav-text">
        <Link to="/investors">
          Investment
        </Link>
        </span>
      </Menu.Item>
      <Menu.Item key="/about">
        <Icon type="user" />
        <span className="nav-text">
        <Link to="/about">
          About
        </Link>
        </span>
      </Menu.Item>
    </Menu>
  );
});

const menuStyles = {
  menu: {
    '& .nav-text a': {
      textDecoration: 'none',
      color: 'silver'
    }
  }
}

export default injectSheet(menuStyles)(LinkMenu);

import React from "react";
import PropTypes from "prop-types";
import {
  withRouter
} from "react-router-dom";
import { Button, Icon, notification } from "antd";
import injectSheet, { jss } from "react-jss";
import { Layout, Menu } from "antd";
const { SubMenu } = Menu;
const { Header } = Layout;


class AppHeader extends React.Component {
  constructor() {
    super();
    this.state = {
      collapsed: false,
      visible: false
    };
  }

  static propTypes = {
    match: PropTypes.object.isRequired,
    location: PropTypes.object.isRequired,
    history: PropTypes.object.isRequired
  };


  toggle = () => {
    this.setState({collapsed: !this.state.collapsed})
  }

  render() {
    const { classes, match, location, history } = this.props;
    return (
      <Header
        className={classes.header}
      >
        <div>
          <Menu
            mode="horizontal"
            onClick={
              ({ item, key, keyPath }) => {
                history.push(key)
              }
            }
            style={{
              borderBottom: "none",
              marginTop: 0
            }}
          >
            <SubMenu
              style={{
                borderBottom: "none"
              }}
              title={
                <span>
                  <Icon
                    className="trigger"
                    type={this.state.collapsed ? "menu-unfold" : "menu-fold"}
                    onClick={this.toggle}
                  />
                </span>
              }
            >
              <Menu.Item key="/contact">Contact</Menu.Item>
              <Menu.Item key="/about">About</Menu.Item>
              <Menu.Item key="/logout">Sign out</Menu.Item>
            </SubMenu>
          </Menu>
        </div>
      </Header>
    )
  }
}

const headerStyles = {
  header: {
    background: '#fff',
    padding: 0,
    height: 40,
    position: 'fixed',
    width: '100%',
    right: 0,
    zIndex: 1,
    display: "flex",
    justifyContent: 'flex-end',
    fontSize: 15,
    '@media (min-width: 576px)': {
    },
  },
}
const AppHeaderWithRouter = withRouter(AppHeader);

export default injectSheet(headerStyles)(AppHeaderWithRouter);

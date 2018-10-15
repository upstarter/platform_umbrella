import React from "react";
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

  render() {
    const { classes } = this.props;

    return (
      <Header
        className={classes.header}
        style={{ background: "#fff", padding: 0 }}
      >

        <div style={{ display: "flex" }}>
          <Icon type="mail" style={{ paddingRight: 20 }} />
          <Menu
            mode="horizontal"
            onClick={
              null
              // handleClickMenu
            }
            style={{
              borderBottom: "none",
              marginTop: 0
            }}
          >
            <SubMenu
              style={{
                float: "right",
                padding: 8,
                borderBottom: "none"
              }}
              title={
                <span>
                  <Icon type="user" />
                  "user.username"
                </span>
              }
            >
              <Menu.Item key="logout">Sign out</Menu.Item>
            </SubMenu>
          </Menu>
        </div>
        <div>
          <Icon
            className="trigger"
            type={this.state.collapsed ? "menu-unfold" : "menu-fold"}
            onClick={this.toggle}
            style={{  paddingRight: 20 }}
          />
        </div>
      </Header>
    )
  }
}

const headerStyles = {
  header: {
    display: "flex",
    justifyContent: 'flex-end',
    fontSize: 15
  },
}
export default injectSheet(headerStyles)(AppHeader);

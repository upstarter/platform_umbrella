import React from "react";
import { Link, withRouter } from "react-router-dom";
import { Menu, Icon } from "antd";
import injectSheet, { jss } from "react-jss";

const LinkMenu = withRouter(props => {
  const { location } = props;
  const { classes } = props;
  return (
    <Menu
      className={classes.menu}
      theme="dark"
      mode="inline"
      selectedKeys={[location.pathname]}
      defaultSelectedKeys={["/portfolio"]}
    >
      <Menu.Item key="/">
        <Link to="/" style={{ textDecoration: "none" }}>
          <Icon type="user" />
          <span className="nav-text">Submit Ballot</span>
        </Link>
      </Menu.Item>
      <Menu.Item key="/contribute">
        <Link to="/contribute" style={{ textDecoration: "none" }}>
          <Icon type="form" />
          <span className="nav-text">Contribute</span>
        </Link>
      </Menu.Item>

      <Menu.Item key="/insight">
        <Link to="/insight" style={{ textDecoration: "none" }}>
          <Icon type="rise" />
          <span className="nav-text">Insight</span>
        </Link>
      </Menu.Item>
      <Menu.Item key="/proposals">
        <Link to="/proposals" style={{ textDecoration: "none" }}>
          <Icon type="notification" />
          <span className="nav-text">Make Proposal</span>
        </Link>
      </Menu.Item>
      <Menu.Item key="/about">
        <Link to="/about" style={{ textDecoration: "none" }}>
          <Icon type="team" />
          <span className="nav-text">About</span>
        </Link>
      </Menu.Item>
      <Menu.Item key="/investors">
        <Link to="/investors" style={{ textDecoration: "none" }}>
          <Icon type="usergroup-add" />
          <span className="nav-text">Join</span>
        </Link>
      </Menu.Item>
    </Menu>
  );
});

const menuStyles = {
  menu: {
    "& .nav-text a": {
      textDecoration: "none",
      color: "silver"
    }
  }
};

// <Menu.Item key="/protocol">
//   <Icon type="area-chart" />
//   <span className="nav-text">
//   <Link to="/protocol">
//     Protocol
//   </Link>
//   </span>
// </Menu.Item>
// <Menu.Item key="/analysis">
//   <Icon type="area-chart" />
//   <span className="nav-text">
//   <Link to="/analysis">
//     Analysis
//   </Link>
//   </span>
// </Menu.Item>
export default injectSheet(menuStyles)(LinkMenu);

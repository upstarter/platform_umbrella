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
            Submit Ballot
          </Link>
        </span>
      </Menu.Item>
      <Menu.Item key="/contribute">
        <Icon type="form" />
        <span className="nav-text">
          <Link to="/contribute">
            Contribute
          </Link>
        </span>
      </Menu.Item>

      <Menu.Item key="/investors">
        <Icon type="rise" />
        <span className="nav-text">
        <Link to="/investors">
          Insight
        </Link>
        </span>
      </Menu.Item>
      <Menu.Item key="/proposals">
        <Icon type="notification" />
        <span className="nav-text">
        <Link to="/proposals">
          Make Proposal
        </Link>
        </span>
      </Menu.Item>
      <Menu.Item key="/about">
        <Icon type="team" />
        <span className="nav-text">
        <Link to="/about">
          About
        </Link>
        </span>
      </Menu.Item>
      <Menu.Item key="/join">
        <Icon type="usergroup-add" />
        <span className="nav-text">
        <Link to="/join">
          Join
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

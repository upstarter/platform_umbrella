import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route, Link } from "react-router-dom";
import LinkMenu from "../../components/SiderMenu/LinkMenu";
import NavContainer from "../../components/nav/NavContainer";
import Login from "../../views/Login/Login";
import PrivateRoute from "../../components/PrivateRoute/PrivateRoute";
import PortfolioComponent from "../../components/portfolio/PortfolioComponent";
import PrivacyComponent from "../PrivacyComponent";
import BlogComponent from "../../components/blog/BlogComponent";
import FooterComponent from "./FooterComponent";
import { Layout, Menu, Icon, Drawer } from "antd";
const { Content, Sider, Header } = Layout;
const { SubMenu } = Menu;
import config from "../../utils/config";

import SiderMenu from "../../components/SiderMenu/SiderMenu";
import injectSheet, { jss } from "react-jss";
import typography from "../../styles/typography";

import Loadable from "react-loadable";

const HomeComponent = Loadable({
  loader: () => import("./HomeComponent" /* webpackChunkName: "home" */),
  loading() {
    return <div>Loading...</div>;
  }
});

const AboutComponent = Loadable({
  loader: () => import("./AboutComponent" /* webpackChunkName: "about" */),
  loading() {
    return <div>Loading...</div>;
  }
});

const ProviderContainer = Loadable({
  loader: () =>
    import("../providers/ProviderContainer" /* webpackChunkName: "provider" */),
  loading() {
    return <div>Loading...</div>;
  }
});

const Protected = () => <h3>Protected</h3>;

class HomeContainer extends React.Component {
  constructor() {
    super();
    this.state = {
      collapsed: false
    };
  }
  switchSider() {
    this.setState({ collapsed: !this.state.collapsed });
  }
  render() {
    const { classes } = this.props;
    return (
      <React.Fragment>
        <BrowserRouter>
          <Layout id="wrapper" style={{ height: "100vh", position: "bottom" }}>
            <SiderMenu />
            <Layout style={{ height: "100vh" }}>
              <Header
                className={classes.header}
                style={{ background: "#fff", padding: 0 }}
              >
                <div style={{ display: "flex" }}>
                  <div className={null}>
                    <Icon type="mail" />
                  </div>
                  <Menu
                    mode="horizontal"
                    onClick={
                      null
                      // handleClickMenu
                    }
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
              </Header>
              <Content style={{ padding: 24, background: "#fff" }}>
                <Route exact path="/" component={PortfolioComponent} />
                <Route exact path="/contribute" component={ProviderContainer} />
                <Route exact path="/investors" component={HomeComponent} />
                <PrivateRoute exact path="/profile" component={Protected} />
                <Route exact path="/about" component={AboutComponent} />
                <Route exact path="/login" component={Login} />
                <Route
                  exact
                  path="/privacy_policy"
                  component={PrivacyComponent}
                />
              </Content>
            </Layout>
          </Layout>
        </BrowserRouter>
      </React.Fragment>
    );
  }
}

const appStyles = {
  typography: `${typography}`,
  header: {
    display: "flex",
    justifyContent: "space-between",
    fontSize: 15
  },
  logo: {
    height: "64px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center"
  }
};

export default injectSheet(appStyles)(HomeContainer);

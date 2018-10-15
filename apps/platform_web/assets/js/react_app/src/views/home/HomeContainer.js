import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route, Link } from "react-router-dom";
import AppHeader from "../../views/header/AppHeader";
import PortfolioComponent from "../../views/portfolio/PortfolioComponent";
import Login from "../../views/auth/Login";
import Logout from "../../views/auth/Logout";
import Signup from "../../views/auth/Signup";
import PrivateRoute from "../../components/auth/PrivateRoute";
import PrivacyComponent from "../PrivacyComponent";
import FooterComponent from "./FooterComponent";
import { Layout, Menu, Icon, Drawer } from "antd";
const { Content, Sider } = Layout;
const { SubMenu } = Menu;
import config from "../../utils/config";

import SiderMenu from "../../views/SiderMenu/SiderMenu";
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
      visible: false
    };
  }
  switchSider() {
    this.setState({ collapsed: !this.state.collapsed });
  }
  showDrawer = () => {
    this.setState({
      visible: true
    });
  };

  onClose = () => {
    this.setState({
      visible: false
    });
  };
  render() {
    const { classes } = this.props;
    return (
      <React.Fragment>
        <BrowserRouter>
          <Layout className={classes.typography} id="wrapper">
            <Drawer
              title="Basic Drawer"
              placement="right"
              closable={true}
              onClose={this.onClose}
              visible={this.state.visible}
            >
              <p>Some contents...</p>
              <p>Some contents...</p>
              <p>Some contents...</p>
            </Drawer>
            <SiderMenu />
            <Layout>
              <AppHeader />
              <Content style={{ background: "#fff" }}>
                <Route exact path="/" component={PortfolioComponent} />
                <Route exact path="/contribute" component={ProviderContainer} />
                <Route exact path="/investors" component={HomeComponent} />
                <PrivateRoute exact path="/profile" component={Protected} />
                <Route exact path="/about" component={AboutComponent} />
                <Route exact path="/signup" component={Signup} />
                <Route exact path="/login" component={Login} />
                <Route exact path="/logout" component={Logout} />
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
  logo: {
    height: "64px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center"
  }
};

export default injectSheet(appStyles)(HomeContainer);

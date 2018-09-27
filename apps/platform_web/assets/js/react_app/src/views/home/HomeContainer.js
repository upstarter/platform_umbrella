import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route, Link } from "react-router-dom";
import LinkMenu from "../../components/SiderMenu/LinkMenu"
import NavContainer from "../../components/nav/NavContainer";
import Login from "../../views/Login/Login";
import PrivateRoute from "../../components/PrivateRoute/PrivateRoute";
import PortfolioComponent from "../../components/portfolio/PortfolioComponent";
import PrivacyComponent from "../PrivacyComponent";
import BlogComponent from "../../components/blog/BlogComponent";
import FooterComponent from "./FooterComponent";
import { Layout } from 'antd';
const { Header, Content } = Layout;
import SiderMenu from "../../components/SiderMenu/SiderMenu"
import injectSheet, { jss } from "react-jss"
import typography from '../../styles/typography'

import Loadable from 'react-loadable';

const HomeComponent = Loadable({
  loader: () => import('./HomeComponent'  /* webpackChunkName: "home" */),
  loading() {
    return <div>Loading...</div>
  }
});

const AboutComponent = Loadable({
  loader: () => import('./AboutComponent' /* webpackChunkName: "about" */),
  loading() {
    return <div>Loading...</div>
  }
});

const ProviderContainer = Loadable({
  loader: () => import('../providers/ProviderContainer' /* webpackChunkName: "provider" */),
  loading() {
    return <div>Loading...</div>
  }
});

const Protected = () => <h3>Protected</h3>;

class HomeContainer extends React.Component {
  render() {
    const { classes } = this.props
    return (
      <React.Fragment>
        <BrowserRouter>
          <section id="wrapper">
            <Layout style={{height: '100vh', position: 'bottom'}}>
              <Header>Header</Header>
              <Layout style={{height: '100vh'}}>
                <SiderMenu/>
                <Content>
                  <Route exact path="/contribute" component={ProviderContainer} />
                  <Route exact path="/" component={PortfolioComponent} />
                  <Route exact path="/investors" component={HomeComponent} />
                  <PrivateRoute exact path="/profile" component={Protected} />
                  <Route exact path="/about" component={AboutComponent} />
                  <Route exact path="/login" component={Login} />
                  <Route exact path="/privacy_policy" component={PrivacyComponent} />
                </Content>
              </Layout>
              <FooterComponent />
            </Layout>
          </section>
        </BrowserRouter>
      </React.Fragment>
    );
  }
}

const appStyles = {
  typography: `${typography}`
}

export default injectSheet(appStyles)(HomeContainer)

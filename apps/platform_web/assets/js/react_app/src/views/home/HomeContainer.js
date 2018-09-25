import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route, Link } from "react-router-dom";
import LinkMenu from "../../components/shared/LinkMenu"
import NavContainer from "../../components/nav/NavContainer";
import Login from "../../views/Login/Login";
import PrivateRoute from "../../components/PrivateRoute/PrivateRoute";
// import HomeComponent from "./HomeComponent";
// import AboutComponent from "./AboutComponent";
import PortfolioContainer from "../../components/portfolio/PortfolioContainer";
import PrivacyComponent from "../PrivacyComponent";
import BlogComponent from "../../components/blog/BlogComponent";
// import BlogListContainer from "../../components/blog/BlogListContainer";
import FooterComponent from "./FooterComponent";
import { Layout } from 'antd';
const { Header, Content, Footer, Sider } = Layout;
import injectSheet, { jss } from "react-jss"
import typography from '../../styles/typography'
// import ProviderContainer from "../providers/ProviderContainer";
// import ProviderComponent from "../providers/ProviderComponent";

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
          <section id="wrapper" className={classes.typography}>
            <Layout>
              <Header>
                <NavContainer />
              </Header>
              <Layout>
                <Sider
                  breakpoint="lg"
                  collapsedWidth="0"
                  onBreakpoint={(broken) => { console.log(broken); }}
                  onCollapse={(collapsed, type) => { console.log(collapsed, type); }}
                >
                <div className="logo" />
                <LinkMenu />
                </Sider>
                <Content>
                  <Route exact path="/" component={PortfolioContainer} />
                  <Route exact path="/investors" component={HomeComponent} />
                  <Route exact path="/login" component={Login} />
                  <PrivateRoute exact path="/profile" component={Protected} />
                  <Route exact path="/about" component={AboutComponent} />
                  <Route exact path="/contribute" component={ProviderContainer} />
                  <Route exact path="/privacy_policy" component={PrivacyComponent} />
                </Content>
              </Layout>
              <Footer>
                <FooterComponent />
              </Footer>
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

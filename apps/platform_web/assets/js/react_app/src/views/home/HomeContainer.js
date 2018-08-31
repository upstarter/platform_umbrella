import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route, Link } from "react-router-dom";

import NavContainer from "../../components/nav/NavContainer";
import PrivateRoute from "../../components/PrivateRoute/PrivateRoute";
import HomeComponent from "./HomeComponent";
import AboutComponent from "./AboutComponent";
import PortfolioContainer from "../../components/portfolio/PortfolioContainer";
import PrivacyComponent from "../PrivacyComponent";
import BlogComponent from "../../components/blog/BlogComponent";
import BlogListContainer from "../../components/blog/BlogListContainer";
import ProviderContainer from "../providers/ProviderContainer";
import ProviderComponent from "../providers/ProviderComponent";

const Protected = () => <h3>Protected</h3>;

export default class HomeContainer extends React.Component {
  render() {
    return (
      <React.Fragment>
        <BrowserRouter>
          <section id="container">
            <NavContainer />
            <PrivateRoute path="/app" component={Protected} />
            <Route exact path="/" component={HomeComponent} />
            <Route path="/login" component={Login} />
            <Route exact path="/about" component={AboutComponent} />
            <Route exact path="/portfolio" component={PortfolioContainer} />
            <Route exact path="/contribute" component={ProviderContainer} />
            <Route exact path="/privacy_policy" component={PrivacyComponent} />
            <div id="footer">
              <p className="copyright">Copyright ©2018, Aion Labs, Inc.</p>
              <Link to="/privacy_policy" className="footer-link">
                Privacy Policy
              </Link>
            </div>
          </section>
        </BrowserRouter>
      </React.Fragment>
    );
  }
}

class Login extends React.Component {
  state = {
    redirectToReferrer: false
  };

  login = () => {
    fakeAuth.authenticate(() => {
      this.setState({ redirectToReferrer: true });
    });
  };

  render() {
    const { from } = this.props.location.state || { from: { pathname: "/" } };
    const { redirectToReferrer } = this.state;

    if (redirectToReferrer) {
      return <Redirect to={from} />;
    }

    return (
      <div>
        <p>You must log in to view the page at {from.pathname}</p>
        <button onClick={this.login}>Log in</button>
      </div>
    );
  }
}

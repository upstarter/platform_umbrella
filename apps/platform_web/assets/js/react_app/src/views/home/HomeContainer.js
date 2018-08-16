import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route, Link } from "react-router-dom";

import HomeComponent from "./HomeComponent";
import AboutComponent from "./AboutComponent";
import ProviderContainer from "../../providers/ProviderContainer";
import PortfolioContainer from "../../components/portfolio/PortfolioContainer";
import PrivacyComponent from "../PrivacyComponent";
import BlogComponent from "../../components/blog/BlogComponent";
import BlogListContainer from "../../components/blog/BlogListContainer";
import ProviderComponent from "../../providers/ProviderComponent";

export default class HomeContainer extends React.Component {
  render() {
    return (
      <React.Fragment>
        <BrowserRouter>
          <section id="container">
            <Route exact path="/" component={HomeComponent} />
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

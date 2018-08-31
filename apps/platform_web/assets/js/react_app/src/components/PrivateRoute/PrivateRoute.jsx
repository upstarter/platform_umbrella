import React, { Component } from "react";
import { isLoggedIn } from "../../utils/auth";
import {
  BrowserRouter as Router,
  Route,
  Link,
  Redirect,
  withRouter
} from "react-router-dom";

const PrivateRoute = ({ component: Component, location, ...rest }) => {
  <Route
    {...rest}
    render={props =>
      fakeAuth.isAuthenticated ? (
        <Component {...props} />
      ) : (
        <Redirect
          to={{
            pathname: "/",
            state: { from: props.location }
          }}
        />
      )
    }
  />;
};

export default PrivateRoute;

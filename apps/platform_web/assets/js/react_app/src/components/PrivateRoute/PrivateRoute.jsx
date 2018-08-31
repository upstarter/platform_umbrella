import React, { Component } from "react";
import { isLoggedIn } from "../../utils/auth";
import { BrowserRouter as Router, Route, Redirect } from "react-router-dom";

const PrivateRoute = ({ component: Component, location, ...rest }) => (
  <Route
    {...rest}
    render={props =>
      isLoggedIn ? (
        <Component {...props} />
      ) : (
        <Redirect
          to={{
            pathname: "/login",
            state: { from: props.location }
          }}
        />
      )
    }
  />
);

export default PrivateRoute;

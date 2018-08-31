import React from "react";
import { Redirect } from "react-router-dom";
import Form from "./Form";
import { handleLogin, isLoggedIn } from "../../utils/auth";

class Login extends React.Component {
  constructor() {
    super();
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
  }
  state = {
    username: ``,
    password: ``
  };

  handleUpdate(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    handleLogin(this.state);
  }

  render() {
    if (isLoggedIn()) {
      <Redirect
        to={{
          pathname: "/app",
          state: { from: props.location }
        }}
      />;
    }

    return (
      <div title="Log In">
        <form
          method="post"
          onSubmit={event => {
            handleSubmit(event);
            window.location(`/app`);
          }}
        >
          <p>
            For this demo, please log in with the username <code>gatsby</code>{" "}
            and the password <code>demo</code>.
          </p>
          <label>
            Username
            <input type="text" name="username" onChange={this.handleUpdate} />
          </label>
          <label>
            Password
            <input
              type="password"
              name="password"
              onChange={this.handleUpdate}
            />
          </label>
          <input type="submit" value="Log In" />
        </form>
      </div>
    );
  }
}

export default Login;

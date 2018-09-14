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
    email: ``,
    password: ``
  };

  handleUpdate(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    if (handleLogin(this.state)) {
      this.props.history.push("/profile");
    }
  }

  render() {
    if (isLoggedIn()) {
      return <Redirect to={{ pathname: "/profile" }} />;
    }
    return (
      <div title="Log In" className="light-wrap container">
        <div className="is-centered">
          <article className="card is-rounded">
            <form
              onSubmit={event => {
                this.handleSubmit(event);
              }}
            >
              <div className="card-content">
                <h1 className="title">
                  <img
                    src="https://placeholdit.imgix.net/~text?txtsize=13&txt=150%C3%9750&w=150&h=50"
                    alt="logo"
                    width={200}
                  />
                </h1>
                <p className="control has-icon">
                  <input
                    className="input"
                    type="email"
                    placeholder="Email"
                    name="email"
                    onChange={this.handleUpdate}
                  />
                  <i className="fa fa-envelope" />
                </p>
                <p className="control has-icon">
                  <input
                    className="input"
                    type="password"
                    placeholder="Password"
                    name="password"
                    onChange={this.handleUpdate}
                  />
                  <i className="fa fa-lock" />
                </p>
                <p className="control">
                  <button
                    type="submit"
                    className="button is-primary is-medium is-fullwidth"
                  >
                    <i className="fa fa-user" />
                    Login
                  </button>
                </p>
              </div>
            </form>
          </article>
        </div>
        <div className="">
          <p>
            For this demo, please log in with the username{" "}
            <code>cryptowise@gmail.com</code> and the password <code>demo</code>
            .
          </p>
        </div>
      </div>
    );
  }
}

export default Login;

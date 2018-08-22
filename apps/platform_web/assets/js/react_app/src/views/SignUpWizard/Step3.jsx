import React, { Component } from "react";
import injectSheet from "react-jss";
import Tile from "../../components/Tile/Tile";
import logo from "../../../../../static/images/nav_logo.svg";
import fbsvg from "../../../../../static/images/facebook.svg";
import fbWhite from "../../../../../static/images/facebook-white.svg";
import googleLogo from "../../../../../static/images/google.svg";
import googleLogoWhite from "../../../../../static/images/google-plus-white.png";

const styles = {
  container: {
    height: "100%",
    display: "flex",
    flexDirection: "column"
    // justifyContent: "space-between"
  },
  header: {
    backgroundColor: "#373A40",
    height: "220px",
    width: "100%",
    padding: "7em 15em 0 15em",
    textAlign: "center"
  },
  title: {
    fontSize: "25px",
    color: "white"
    // textAlign: "center"
  },
  main: {
    padding: "1em 15em",
    display: "flex",
    justifyContent: "space-around",
    paddingTop: "5em"
  },
  tileGrid: {
    display: "grid",
    gridTemplateColumns: "repeat(6, 100px)",
    gridTemplateRows: "repeat(3, 100px)",
    gridColumnGap: "1em",
    gridRowGap: "1em"
  },
  socialButtons: {
    flex: "1",
    maxWidth: "40%"
  },
  loginForm: {
    flex: "1",
    maxWidth: "40%"
  },
  vl: {
    borderLeft: "1px solid black",
    height: "20em"
  },
  facebook_connect: {
    background: `rgb(255, 255, 255) url(${fbsvg}) no-repeat scroll 5px 0px / 30px 50px padding-box border-box`,
    "&:hover": {
      background: `rgb(60, 90, 154) url(${fbWhite}) no-repeat scroll 5px 0px / 30px 50px padding-box border-box`
    }
  },
  google_connect: {
    background: `rgb(255, 255, 255) url(${googleLogo}) no-repeat scroll 10px 0px / 30px 50px padding-box border-box`,
    "&:hover": {
      background: `rgb(220, 74, 61) url(${googleLogo}) no-repeat scroll 10px 0px / 30px 50px padding-box border-box`
    }
  },
  "@media (max-width: 768px)": {
    main: {
      display: "block"
    },
    socialButtons: {
      maxWidth: "100%"
    },
    vl: {
      borderTop: "1px solid black",
      width: "40em",
      borderLeft: "0"
    }
  },
  "@media (max-width: 414px)": {
    tileGrid: {
      gridTemplateColumns: "1fr 1fr"
    },
    main: {
      padding: "1em 1em"
    },
    header: {
      padding: "2em 5em",
      height: "110px",
      lineHeight: "3em"
    },
    title: {
      fontSize: "20px"
    },
    loginForm: {
      maxWidth: "100%"
    }
  }
};

class Step3Unstyled extends Component {
  constructor(props) {
    super(props);
    // this._validate = this._validate.bind(this);
    // Bindings for form fields would go here,
    // and state would keep track of field input
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleEmailChange = this.handleEmailChange.bind(this);
    this.handleNameChange = this.handleNameChange.bind(this);
    this.handlePasswordChange = this.handlePasswordChange.bind(this);
    this.state = {
      email: null,
      name: null,
      password: null
    };
  }
  // _validate() {
  //   // a sanitized version of state can be passed instead
  //   this.props.afterValid(this.state);
  // }
  handleEmailChange(event) {
    this.setState({ email: event.target.value });
  }
  handleNameChange(event) {
    this.setState({ name: event.target.value });
  }
  handlePasswordChange(event) {
    this.setState({ password: event.target.value });
  }
  handleSubmit(event) {
    event.preventDefault();
    console.log(this.state);
    this.props.saveForm(this.state);
  }
  render() {
    let props = this.props;
    let classes = props.classes;
    if (props.currentStep !== 3) {
      return null;
    }
    let Tiles = [];
    for (let i = 0; i < 18; i++) {
      Tiles.push(<Tile />);
    }
    return (
      <div className={classes.container}>
        <div className={classes.header}>
          <img src={logo} style={{ width: "30em" }} />
          <h2 className={classes.title}>Monetize your crypto capabilities</h2>
        </div>
        <div className={classes.main}>
          <div className={classes.socialButtons}>
            <a
              href="#"
              className={"social-button " + classes.facebook_connect}
              id="facebook-connect"
            >
              {" "}
              <span>Connect with Facebook</span>
            </a>
            <a
              href="#"
              className={"social-button " + classes.google_connect}
              id="google-connect"
            >
              {" "}
              <span>Connect with Google</span>
            </a>
          </div>
          <div className={classes.vl} />
          <div className={classes.loginForm}>
            <form
              onSubmit={e => {
                this.handleSubmit(e);
              }}
            >
              <div className="field">
                <label htmlFor className="label">
                  Name
                </label>
                <div className="control has-icons-left">
                  <input
                    value={this.state.name}
                    type="fullname"
                    placeholder="e.g. Bob Smith"
                    className="input"
                    required
                    onChange={this.handleNameChange}
                  />
                  <span className="icon is-small is-left">
                    <i className="fa fa-envelope" />
                  </span>
                </div>
              </div>
              <div className="field">
                <label htmlFor className="label">
                  Email
                </label>
                <div className="control has-icons-left">
                  <input
                    value={this.state.email}
                    type="email"
                    placeholder="e.g. bobsmith@gmail.com"
                    className="input"
                    required
                    onChange={this.handleEmailChange}
                  />
                  <span className="icon is-small is-left">
                    <i className="fa fa-envelope" />
                  </span>
                </div>
              </div>
              <div className="field">
                <label htmlFor className="label">
                  Password
                </label>
                <div className="control has-icons-left">
                  <input
                    value={this.state.password}
                    type="password"
                    placeholder="*******"
                    className="input"
                    required
                    onChange={this.handlePasswordChange}
                  />
                  <span className="icon is-small is-left">
                    <i className="fa fa-lock" />
                  </span>
                </div>
              </div>
              <div className="field">
                <label htmlFor className="checkbox">
                  <input type="checkbox" />
                  Remember me
                </label>
              </div>
              <div className="field">
                <button onClick={this.props.prev} className="button is-primary">
                  Back
                </button>
                <button
                  onClick={this.submit}
                  // type="submit"
                  className="button is-success"
                >
                  Submit
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

const Step3 = injectSheet(styles)(Step3Unstyled);
export default Step3;

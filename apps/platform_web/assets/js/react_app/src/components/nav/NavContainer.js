import React from "react";
import ReactDOM from "react-dom";
import img from "../../../../../static/images/nav_logo.svg";
import { Link } from "react-router-dom";

export default class NavContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      didScroll: false,
      lastScrollTop: 0,
      delta: 5,
      isHide: false
    };
    this.hideBar = this.hideBar.bind(this);
  }
  componentDidMount() {
    window.addEventListener("scroll", this.hideBar);
  }
  componentWillUnmount() {
    window.removeEventListener("scroll", this.hideBar);
  }
  hideBar() {
    let { isHide } = this.state;
    window.scrollY > this.prev
      ? !isHide && this.setState({ isHide: true })
      : isHide && this.setState({ isHide: false });

    this.prev = window.scrollY;
  }

  render() {
    let classHide = this.state.isHide ? "hide" : "";
    return (
      <React.Fragment>
        <nav
          id="nav"
          className={`navbar nav-down ${classHide}`}
          role="navigation"
          aria-label="main navigation"
          style={{
            transition: "top .3s",
            top: this.state.isHide ? "-50px" : "0px"
          }}
        >
          <div className="container">
            <div className="navbar-brand">
              <Link to="/" className="navbar-item nav-logo">
                <img
                  src={img}
                  alt="Logo for CryptoWise: Cryptoasset research, analysis"
                />
              </Link>
              <div className="navbar-burger burger" data-target="navMenu">
                <span aria-hidden="true" />
                <span aria-hidden="true" />
                <span aria-hidden="true" />
              </div>
            </div>
            <div className="navbar-menu" id="navMenu">
              <div className="navbar-start">
                <Link to="/about" className="navbar-item">
                  About
                </Link>
                <Link to="/portfolio" className="navbar-item">
                  Porfolio
                </Link>
              </div>

              <div className="navbar-end">
                <Link to="/" className="navbar-item">
                  Investors
                </Link>
                <Link to="/contribute" className="navbar-item">
                  Analysts
                </Link>
              </div>
            </div>
          </div>
        </nav>
      </React.Fragment>
    );
  }
}

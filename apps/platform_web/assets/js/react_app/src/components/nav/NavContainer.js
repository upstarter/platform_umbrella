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
    // -- Navbar menu JS
    window.addEventListener("DOMContentLoaded", () => {
      // Get all "navbar-burger" elements
      const $navbarBurgers = Array.prototype.slice.call(
        document.querySelectorAll(".navbar-burger"),
        0
      );

      // Check if there are any navbar burgers
      if ($navbarBurgers.length > 0) {
        // Add a click event on each of them
        $navbarBurgers.forEach(burger => {
          burger.addEventListener("click", () => {
            // Get the target from the "data-target" attribute
            const target = burger.dataset.target;
            const $target = document.getElementById(target);
            // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
            burger.classList.toggle("is-active");
            $target.classList.toggle("is-active");
          });
        });
      }
    });

    const $navbarLinks = Array.prototype.slice.call(
      document.querySelectorAll(".navbar-menu div a"),
      0
    );
    const $navMenu = $navbarLinks[0].parentElement.parentElement;

    $navbarLinks.forEach(link => {
      link.addEventListener("click", () => {
        const $burger = document.querySelector(".navbar-burger");

        // Toggle the "is-active" class on burger & "navbar-menu"
        $burger.classList.toggle("is-active");
        $navMenu.classList.toggle("is-active");
      });
    });
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
                <Link to="/login" className="navbar-item">
                  Login
                </Link>
              </div>
            </div>
          </div>
        </nav>
      </React.Fragment>
    );
  }
}

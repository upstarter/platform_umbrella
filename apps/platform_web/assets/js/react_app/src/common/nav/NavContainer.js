import React from "react"
import ReactDOM from "react-dom"
import img from "../../../../../static/images/nav_logo.svg"
import { Link } from "react-router-dom"

export default class NavContainer extends React.Component {

  constructor(props) {
    super(props);
    this.state = { didScroll: false, lastScrollTop: 0, delta: 5 }
  }

  render() {
    return (
      <React.Fragment>
        <nav id="nav" className="navbar nav-down" role="navigation" aria-label="main navigation">
          <div className="container">
            <div className="navbar-brand">
              <Link to="/" className="navbar-item .nav-logo">
                <img src={img} alt="Logo for CryptoWise: Cryptoasset research, analysis" width="130" height="60"></img>
              </Link>
              <div className="navbar-burger burger" data-target="navMenu">
               <span aria-hidden="true"></span>
               <span aria-hidden="true"></span>
               <span aria-hidden="true"></span>
              </div>
            </div>
            <div className="navbar-menu" id="navMenu">
              <Link to="/" className="navbar-item">Home</Link>
              <Link to="/about" className="navbar-item">About</Link>
              <Link to="/blog" className="navbar-item">Blog</Link>
            </div>
          </div>
        </nav>
      </React.Fragment>
    )
  }

  componentDidMount() {
    // Hide Header on on scroll down
    this.setState({navbarHeight: $('#nav').outerHeight()});
    $(window).scroll((event) => {
        this.setState({didScroll: true})
    });

    this.inverval = setInterval(() => {
        if (this.state.didScroll) {
            this.hasScrolled();
            this.setState({didScroll: false})
        }
    }, 250);

  }

  hasScrolled() {
      let st = $(document).scrollTop();

      // Make sure they scroll more than delta
      if(Math.abs(this.state.lastScrollTop - st) <= this.state.delta)
          return;

      // If they scrolled down and are past the navbar, add class .nav-up.
      // This is necessary so you never see what is "behind" the navbar.
      if (st > this.state.lastScrollTop && st > this.state.navbarHeight){
          // Scroll Down
          $('#nav').removeClass('nav-down').addClass('nav-up');
      } else {
          // Scroll Up
          if(st + $(window).height() < $(document).height()) {
              $('#nav').removeClass('nav-up').addClass('nav-down');
          }
      }

      this.state.lastScrollTop = st;
  }
  componentWillUnmount() {
    clearInterval(this.interval);
  }
}

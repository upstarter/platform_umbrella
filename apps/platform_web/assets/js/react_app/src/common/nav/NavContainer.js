import React from "react"
import ReactDOM from "react-dom"
import img from "../../../../../static/images/nav_logo.svg"
import { Link } from "react-router-dom"

export default class NavContainer extends React.Component {
  // state = { comments: [] }

  render() {
    return (
      <React.Fragment>
        <nav id="nav" className="navbar is-fixed-top" role="navigation" aria-label="main navigation">
          <div className="container">
            <div className="navbar-brand">
              <Link to="/" className="navbar-item .nav-logo">
                <img src={img} alt="Logo for CryptoWise: Cryptoasset research, analysis" width="130" height="60"></img>
              </Link>
              <div class="navbar-burger burger" data-target="navMenu">
               <span aria-hidden="true"></span>
               <span aria-hidden="true"></span>
               <span aria-hidden="true"></span>
              </div>
            </div>
            <div className="navbar-menu" id="navMenu">
              <Link to="/" className="navbar-item">Home</Link>
              <Link to="/press" className="navbar-item">Press</Link>
              <Link to="/blog" className="navbar-item">Blog</Link>
            </div>
          </div>
        </nav>
      </React.Fragment>
    )
  }
}

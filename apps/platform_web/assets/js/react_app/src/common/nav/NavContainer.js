import React from "react"
import ReactDOM from "react-dom"
import img from "../../../../../static/images/nav_logo.png"

export default class NavContainer extends React.Component {
  // state = { comments: [] }

  render() {
    return (
      <nav className="navbar" role="navigation" aria-label="main navigation">
        <div className="navbar-brand">
          <a className="navbar-item .nav-logo" href="https://cryptowise.ai">
            <img src={img} alt="CryptoWise: Cryptoasset research & analysis" width="112" height="28"></img>
          </a>

          <a className="navbar-item" href="https://www.cryptowise.ai">
            Home
          </a>
          <a className="navbar-item" href="https://www.cryptowise.ai/press">
            Press
          </a>
          <a className="navbar-item" href="https://www.cryptowise.ai/blog">
            Blog
          </a>
          <a role="button" className="navbar-burger" aria-label="menu" aria-expanded="false">
           <span aria-hidden="true">Yo</span>
           <span aria-hidden="true">BBubb</span>
           <span aria-hidden="true">Hobb</span>
          </a>
        </div>
      </nav>
    )
  }
}
import React from "react"
import ReactDOM from "react-dom"

export default class NavContainer extends React.Component {
  // state = { comments: [] }

  render() {
    return (
      <nav className="navbar" role="navigation" aria-label="main navigation">
        <div className="navbar-brand">
          <a className="navbar-item" href="https://cryptowise.ai">
            <img src="/images/nav_logo.png" alt="CryptoWise: Cryptoasset research & analysis" width="525" height="124"></img>
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
        <div className="navbar-menu">
        </div>
      </nav>
    )
  }
}

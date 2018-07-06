import React from "react"
import ReactDOM from "react-dom"

export default class NavContainer extends React.Component {
  // state = { comments: [] }

  render() {
    return (
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <img src="/images/favicon_symbol.png" alt="CryptoWise: Crowd Robo-Advisory" width="95" height="195"></img>
          <a class="navbar-item" href="https://www.cryptowise.ai">
            Home
          </a>
          <a class="navbar-item" href="https://www.cryptowise.ai/press">
            Press
          </a>
          <a class="navbar-item" href="https://www.cryptowise.ai/blog">
            Blog
          </a>
          <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false">
           <span aria-hidden="true">Press</span>
           <span aria-hidden="true">Blog</span>
           <span aria-hidden="true"></span>
          </a>
        </div>
      </nav>
    )
  }
}

import React from 'react'
import ReactDOM from 'react-dom'
import { url } from '../../utils/consts'
import DataGridComponent from '../DataGrid/DataGridComponent'

export default class PortfolioComponent extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      tokens: [],
      selectedToken: null,
      isLoading: true,
      error: null
    }
  }

  componentDidMount() {
    console.log(`${url}/api/v1/portfolio`)

    this.setState({ isLoading: true })

    fetch(`${url}/api/v1/portfolio`)
      .then(response => {
        if (response.ok) {
          return response.json()
        } else {
          throw new Error('Something went wrong ...')
        }
      })
      .then(data =>
        this.setState({
          blogPosts: data.portfolio,
          selectedPost: data.portfolio[0],
          isLoading: false
        })
      )
      .catch(error => this.setState({ error, isLoading: false }))
  }

  render() {
    return (
      <React.Fragment>
        <section id="portfolio" className="light-wrap">
          <div className="scroll-to is-hidden-desktop">
            <a className="icon">
              <i className="fa fa-chevron-down" />
            </a>
          </div>
          <div id="portfolio-text" className="content centered">
            <h1 className="title portfolio-heading">
              The CryptoWise Collaborative Portfolio (CCP)
            </h1>
            <p>
              Curated by the wisest minds in crypto. Enter your portfolio
              allocation and we will send you regular wisdom of the crowd
              updates.
            </p>
            <h1>React Table Grid Goes Here</h1>

            <DataGridComponent />
          </div>
        </section>
      </React.Fragment>
    )
  }
}

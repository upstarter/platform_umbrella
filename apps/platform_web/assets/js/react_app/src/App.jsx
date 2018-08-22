import React from "react"
import ReactDOM from "react-dom"
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import promiseMiddleware from 'redux-promise-middleware'
import reducers from './reducers'
import HomeContainer from "./views/home/home"

const middleware = applyMiddleware(promiseMiddleware)

const store = createStore(reducers, undefined, middleware)

export default class App extends React.Component {

  render() {
    return (
      <Provider store={store}>
        <HomeContainer/>
      </Provider>
    )
  }
}

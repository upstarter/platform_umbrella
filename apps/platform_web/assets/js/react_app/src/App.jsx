import React from "react"
import ReactDOM from "react-dom"
import { Provider } from 'react-redux'
import { createStore } from 'redux'
import rootReducer from './reducers'
import HomeContainer from "./views/home/home"
const store = createStore(rootReducer);


export default class App extends React.Component {

  render() {
    return (
      <Provider store={store}>
        <HomeContainer/>
      </Provider>
    )
  }
}

import React, { Component } from "react";
import { connect } from "react-redux";
import { bindActionCreators } from "redux";
import { fetchTokens } from "../../actions/index";

class SearchBarContainer extends Component {
  constructor(props) {
    super(props);

    this.state = { term: "" };

    this.onInputChange = this.onInputChange.bind(this);
    this.onFormSubmit = this.onFormSubmit.bind(this);
  }

  onInputChange(event) {
    this.setState({ term: event.target.value });
  }

  onFormSubmit(event) {
    event.preventDefault();

    // We need to go and fetch weather data
    this.props.fetchTokens(this.state.term);
    this.setState({ term: "" });
  }

  render() {
    return (
      <div className="field has-addons">
        <form onSubmit={this.onFormSubmit} className="control">
          <input
            placeholder="Search for Cryptoassets"
            className="control"
            value={this.state.term}
            onChange={this.onInputChange}
          />
          <div className="control">
            <a className="button is-info">
              Search
            </a>
          </div>
        </form>
      </div>
    );
  }
}


//anything returned from here will end up as props on BookListContainer
//whenever selectPost is called the result should be passed to all reducers

const mapDispatchToProps = (dispatch, ownProps) => {
  return bindActionCreators({fetchTokens: fetchTokens}, dispatch);
}

// connect takes a function and component and produces a container that is aware
// of state contained by redux
// promote BookList to Container
export default connect(null, mapDispatchToProps)(SearchBarContainer);

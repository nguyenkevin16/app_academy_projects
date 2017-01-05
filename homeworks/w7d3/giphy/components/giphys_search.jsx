import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ searchTerm: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(" ").join("+");
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  render() {
    let { giphys } = this.props;

    return (
      <div>
        <form className="search-bar">
          <input type="text"
            onChange={this.handleChange}
            value={this.state.searchTerm}></input>
          <button onClick={this.handleSubmit}>Get Giphys!</button>
        </form>

        <GiphysIndex giphys={giphys} />
      </div>
    );
  }
}

export default GiphysSearch;

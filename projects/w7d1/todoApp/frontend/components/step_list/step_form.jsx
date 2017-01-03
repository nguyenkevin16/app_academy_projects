import React from 'react';
import { receiveStep } from '../../actions/step_actions';
import { uniqueId } from '../../util/api_utils';

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateState = this.updateState.bind(this);
  }

  updateState(label) {
    if (label === "title") {
      return event => this.setState({title: event.target.value});
    } else {
      return event => this.setState({body: event.target.value});
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    const newStep = Object.assign({}, this.state, {id: uniqueId()});
    this.props.receiveStep(newStep);
    this.setState({
      title: "",
      body: ""
    });
  }

  render() {
    return (
      <form className="step-form" onSubmit={this.handleSubmit}>
        <label>Title
          <input type="text"
            value={this.state.title}
            onChange={this.updateState('title')}
            required />
        </label>
        <label>Body
          <textarea type="text"
            value={this.state.body}
            onChange={this.updateState('body')}
            required>
          </textarea>
        </label>

        <button>Create Step!!</button>
      </form>
    );
  }
}

export default StepForm;

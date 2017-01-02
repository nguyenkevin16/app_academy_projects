import React from 'react';
import { receiveTodo } from '../../actions/todo_actions';
import { uniqueId } from '../../util/api_utils';

class TodoForm extends React.Component {
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
    const newTodo = Object.assign({}, this.state, {id: uniqueId()});
    this.props.receiveTodo(newTodo);
    this.setState({
      title: "",
      body: ""
    });
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit}>
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

        <button>Create Todo!!</button>
      </form>
    );
  }
}

export default TodoForm;

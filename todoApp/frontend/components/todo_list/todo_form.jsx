import { uniqueId } from '../../utils/idGenerator';
import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false,
      tag_names: []
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleTag = this.handleTag.bind(this);
    this.updateTag = this.updateTag.bind(this);
  }

  update(property) {
    return e => this.setState({[property]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.createTodo(todo).then(() => {
      this.setState({
        title: "",
        body: ""
      });
    });
  }

  updateTag(e) {
    this.setState({tag_names: [...this.state.tag_names, e.target.value]});
  }

  handleTag(e) {
    e.preventDefault();
    this.updateTag(e);
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit}>
        <label>Title:
          <input
            className="input"
            ref="title"
            value={this.state.title}
            placeholder="buy milk"
            onChange={this.update('title')}
            required/>
        </label>
        <label>Body:
          <textarea
            className="input"
            ref="body"
            cols='20'
            value={this.state.body}
            rows='5'
            placeholder="2% or whatever is on sale!"
            onChange={this.update('body')}
            required></textarea>
        </label>

        <label>Tags:
          <ul>
            {
              this.state.tag_names.map((tag, i) => (
                <li key={i}>{ tag.name }</li>
              ))
            }
          </ul>

          <input type="text"
            onChange={this.updateTag} />
          <button type="button"
            onClick={this.handleTag}>
            Create Tag!
          </button>
        </label>

        <button className="create-button">Create Todo!</button>

        <ul className="todo-form-errors">
          {this.props.errors.map((error, i) => (
            <li key={i}>{error}</li>
          ))}
        </ul>
      </form>
    );
  }
}

export default TodoForm;

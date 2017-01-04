import { uniqueId } from '../../utils/idGenerator';
import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false,
      tag_names: [],
      tagInput: ""
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
        body: "",
        tag_names: []
      });
    });
  }

  updateTag(e) {
    this.setState({tagInput: e.target.value});
  }

  handleTag() {
    event.preventDefault();
    this.setState({tag_names: [...this.state.tag_names, this.state.tagInput]});
    this.setState({tagInput: ""});
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit}>
        <div className="todo-form-input">
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
            <ul className="tag-list">
              {
                this.state.tag_names.map((tag, i) => (
                  <li key={i}>tag: { tag }</li>
                ))
              }
            </ul>

            <input type="text"
              value={this.state.tagInput}
              onChange={this.updateTag} />
            <button type="button"
              className="create-button"
              onClick={this.handleTag}>
              Create Tag!
            </button>
          </label>
        </div>

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

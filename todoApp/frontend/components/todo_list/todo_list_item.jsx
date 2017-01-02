import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.todo = this.props.todo;
    this.title = this.todo.title;
    this.removeTodo = this.props.removeTodo;
    this.updateTodo = this.props.updateTodo;

    this.renderUpdate = this.renderUpdate.bind(this);
  }

  renderUpdate() {
    return (this.props.todo.done === false ? "Done" : "Undo");
  }

  render() {
    return (
      <div>
        <li>{ this.title }</li>
        <button onClick={this.removeTodo(this.todo)}>Delete</button>
        <button onClick={(this.updateTodo(this.todo))}>
          {this.renderUpdate()}
        </button>
      </div>
    );
  }
}

export default TodoListItem;

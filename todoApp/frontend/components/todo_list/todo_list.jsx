import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todos = this.props.todos.map((todo, i) => (
      <TodoListItem key={i}
        todo={todo}
        removeTodo={this.props.removeTodo}
        updateTodo={this.props.updateTodo} />
    ));

    return (
      <div>
        <ul>
          {todos}
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo} />
      </div>
    );
  }
}

export default TodoList;

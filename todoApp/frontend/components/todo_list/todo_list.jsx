import React from 'react';
import TodoListItem from './todo_list_item';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todos = this.props.todos.map((todo, i) => (
      <TodoListItem key={i} todo={todo} />
    ));

    return (
      <ul>
        {todos}
      </ul>
    );
  }
}

export default TodoList;

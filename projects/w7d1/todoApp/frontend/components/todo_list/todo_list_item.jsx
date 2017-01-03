import React from 'react';
import TodoDetailView from './todo_detail_view';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detail: false };

    this.toggleDetail = this.toggleDetail.bind(this);
  }

  toggleDetail(e) {
    e.preventDefault();
    this.setState({ detail: !this.state.detail });
  }

  render() {
    const {todo, removeTodo, updateTodo} = this.props;

    return (
      <div>
        <li onClick={this.toggleDetail}>{ todo.title }</li>
        <button onClick={(updateTodo(todo))}>
          {todo.done === false ? "Done" : "Undo"}
        </button>

        {
          this.state.detail === true ?
          <TodoDetailView todo={todo}
            removeTodo={removeTodo} /> : null
        }
      </div>
    );
  }
}

export default TodoListItem;

// <button onClick={removeTodo(todo)}>Delete</button>

// const TodoListItem = ({todo, removeTodo, updateTodo}) => {
//   return (
//     <div>
//       <li>{ todo.title }</li>
//       <button onClick={(updateTodo(todo))}>
//         {todo.done === false ? "Done" : "Undo"}
//       </button>
//     </div>
//   );
// };

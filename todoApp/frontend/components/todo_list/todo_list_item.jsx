import React from 'react';

const TodoListItem = ({todo, removeTodo, updateTodo}) => {
  return (
    <div>
      <li>{ todo.title }</li>
      <button onClick={removeTodo(todo)}>Delete</button>
      <button onClick={(updateTodo(todo))}>
        {todo.done === false ? "Done" : "Undo"}
      </button>
    </div>
  );
};

export default TodoListItem;

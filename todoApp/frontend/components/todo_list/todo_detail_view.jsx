import React from 'react';

const TodoDetailView = ({todo, removeTodo}) => {
  return (
    <div>
      <p>{ todo.body }</p>
      <button onClick={removeTodo(todo)}>Delete</button>
    </div>
  );
};

export default TodoDetailView;

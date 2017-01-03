import React from 'react';

import StepListContainer from '../step_list/step_list_container';
import { stepsByTodoId } from '../../reducers/selectors';

const TodoDetailView = (state) => {
  return (
    <div>
      <p>{ state.todo.body }</p>
      <StepListContainer steps={stepsByTodoId(state, state.todo.id)} todo_id={state.todo.id}/>
      <button onClick={state.removeTodo(state.todo)}>Delete</button>
    </div>
  );
};

export default TodoDetailView;

// { todo, removeTodo, receiveSteps }

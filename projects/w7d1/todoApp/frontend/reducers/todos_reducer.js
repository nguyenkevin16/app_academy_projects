import merge from 'lodash/merge';
import { RECEIVE_TODOS,
         RECEIVE_TODO,
         REMOVE_TODO,
         UPDATE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = merge({}, state);

  switch(action.type){
    case RECEIVE_TODOS:
      const newState = {};

      action.todos.forEach(todo => {
        newState[todo.id] = todo;
      });

      return newState;
    case RECEIVE_TODO:
      const key = action.todo.id;
      const value = action.todo;

      return merge({}, state, {
        key: value
      });
    case REMOVE_TODO:
      delete nextState[action.id];
      return nextState;
    case UPDATE_TODO:
      let todo = nextState[action.todo.id];
      todo.done = !todo.done;
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;

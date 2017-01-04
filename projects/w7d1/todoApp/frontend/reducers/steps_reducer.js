import merge from 'lodash/merge';
import { RECEIVE_STEPS,
         RECEIVE_STEP,
         REMOVE_STEP,
         UPDATE_STEP } from '../actions/step_actions';

const initialState = {
  1: { // this is the step with id = 1
   id: 1,
   title: "walk to store",
   done: false,
   todo_id: 1
  },
  2: { // this is the step with id = 2
   id: 2,
   title: "buy soap",
   done: false,
   todo_id: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = merge({}, state);

  switch(action.type){
    case RECEIVE_STEPS:
      const newState = {};

      action.steps.forEach(step => {
        newState[step.id] = step;
      });

      return newState;
    case RECEIVE_STEP:
      const key = action.step.id;
      const value = action.step;

      return merge({}, state, {
        key: value
      });
    case REMOVE_STEP:
      delete nextState[action.id];
      return nextState;
    case UPDATE_STEP:
      let step = nextState[action.step.id];
      step.done = !step.done;
      return nextState;
    default:
      return state;
  }
};

export default stepsReducer;

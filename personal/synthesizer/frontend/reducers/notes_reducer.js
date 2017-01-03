import { KEY_PRESSED, KEY_RELEASED } from '../actions/note_actions';
import { NOTE_NAMES } from '../util/tones';

const notesReducer = (state = [], action) => {
  Object.freeze(state);
  let nextState = state.slice();
  let keyIncluded = state.includes(action.key);
  let keyIsNote = NOTE_NAMES.includes(action.key);

  switch (action.type) {
    case KEY_PRESSED:
      if (keyIncluded && keyIsNote) {
        nextState.push(action.key);
        return nextState;
      } else {
        return state;
      }
    case KEY_RELEASED:
      if (keyIncluded && keyIsNote) {
        const keyIdx = nextState.indexOf(action.key);
        nextState = state.splice(keyIdx, 1);
        return nextState;
      } else {
        return state;
      }
    default:
      return state;
  }
};

export default notesReducer;

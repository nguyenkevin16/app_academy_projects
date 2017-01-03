import React from 'react';
import { connect } from 'react-redux';

import TodoDetailView from './todo_detail_view';
import { removeTodo } from '../../actions/todo_actions';
import { receiveSteps } from '../../actions/step_actions';

const mapStateToProps = state => ({
  state
});

const mapDispatchToProps = dispatch => ({
  removeTodo: (todo) => e => dispatch(removeTodo(todo)),
  receiveSteps: (steps) => dispatch(receiveSteps(steps))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoDetailView);

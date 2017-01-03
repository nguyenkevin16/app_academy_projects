import React from 'react';
import { connect } from 'react-redux';

import TodoDetailView from './todo_detail_view';
import { removeTodo } from '../../actions/todo_actions';

const mapDispatchToProps = dispatch => ({
  removeTodo: (todo) => e => dispatch(removeTodo(todo))
});

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

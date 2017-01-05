import React from 'react';
import { connect } from 'react-redux';

import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import { receiveTodo,
         removeTodo,
         updateTodo } from '../../actions/todo_actions';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => e => dispatch(removeTodo(todo)),
  updateTodo: (todo) => e => dispatch(updateTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

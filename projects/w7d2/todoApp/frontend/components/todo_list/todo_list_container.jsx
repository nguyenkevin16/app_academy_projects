import { connect } from 'react-redux';
import TodoList from './todo_list';

// Actions
import { receiveTodos, receiveTodo, fetchTodos, createTodo, updateTodo } from '../../actions/todo_actions';
import { fetchSteps } from '../../actions/step_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = state => ({
  todos: allTodos(state),
  state,
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  fetchTodos: () => dispatch(fetchTodos()),
  fetchSteps: () => dispatch(fetchSteps()),
  // receiveTodos: () => dispatch(receiveTodos()),
  // receiveTodo: todo => dispatch(receiveTodo(todo))
  createTodo: (todo) => dispatch(createTodo(todo)),
  updateTodo: (todo) => dispatch(updateTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

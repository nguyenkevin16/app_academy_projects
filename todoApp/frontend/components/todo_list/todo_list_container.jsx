import { connect } from 'react-redux';
import TodoList from './todo_list';

// Actions
import { receiveTodos, receiveTodo, fetchTodos, createTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = state => ({
  todos: allTodos(state),
  state
});

const mapDispatchToProps = dispatch => ({
  fetchTodos: () => dispatch(fetchTodos()),
  // receiveTodos: () => dispatch(receiveTodos()),
  // receiveTodo: todo => dispatch(receiveTodo(todo))
  createTodo: (todo) => dispatch(createTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export const fetchTodos = () => (
  $.ajax({
    method: 'GET',
    url: 'api/todos'
  })
);

export const createTodo = ({ title, body, done }) => (
  $.ajax({
    method: 'POST',
    url: 'api/todos',
    data: {
      todo: {
        title,
        body,
        done
      }
    }
  })
);

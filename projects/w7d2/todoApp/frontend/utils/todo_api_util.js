export const fetchTodos = () => (
  $.ajax({
    method: 'GET',
    url: 'api/todos'
  })
);

export const createTodo = ({ title, body, done, tag_names }) => (
  $.ajax({
    method: 'POST',
    url: 'api/todos',
    data: {
      todo: {
        title,
        body,
        done,
        tag_names
      }
    }
  })
);

export const updateTodo = ({ title, body, done, id }) => (
  $.ajax({
    method: 'PATCH',
    url: `api/todos/${id}`,
    data: {
      todo: {
        title,
        body,
        done
      }
    }
  })
);

export const deleteTodo = ({ id }) => (
  $.ajax({
    method: 'DELETE',
    url: `api/todos/${id}`
  })
);

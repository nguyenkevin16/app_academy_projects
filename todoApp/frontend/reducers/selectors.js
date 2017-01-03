export const allTodos = (state) => (
  Object.keys(state.todos).map(key => state.todos[key])
);

export const stepsByTodoId = (state, todoId) => {
  const steps = [];

  Object.keys(state.steps).map(key => {
    if (todoId === state.steps[key].todo_id) {
      steps.push(state.steps[key]);
    }
  });

  return steps;
};

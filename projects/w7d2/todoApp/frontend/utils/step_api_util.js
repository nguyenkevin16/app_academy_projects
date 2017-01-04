export const fetchSteps = () => (
  $.ajax({
    method: 'GET',
    url: 'api/steps'
  })
);

export const createStep = ({ title, body, done, todo_id }) => (
  $.ajax({
    method: 'POST',
    url: 'api/steps',
    data: {
      step: {
        title,
        body,
        done,
        todo_id
      }
    }
  })
);

export const updateStep = ({ title, body, done, id }) => (
  $.ajax({
    method: 'PATCH',
    url: `api/steps/${id}`,
    data: {
      step: {
        title,
        body,
        done
      }
    }
  })
);

export const deleteStep = ({ id }) => (
  $.ajax({
    method: 'DELETE',
    url: `api/steps/${id}`
  })
);

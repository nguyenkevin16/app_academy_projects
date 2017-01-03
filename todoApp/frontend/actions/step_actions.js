export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";
export const UPDATE_STEP = "UPDATE_STEP";

export const receiveSteps = (steps) => ({
  type: RECEIVE_STEPS,
  steps
});

export const receiveStep = (step) => ({
  type: RECEIVE_STEP,
  step
});

export const removeStep = (step) => ({
  type: REMOVE_STEP,
  id: step.id
});

export const updateStep = (step) => ({
  type: UPDATE_STEP,
  step
});

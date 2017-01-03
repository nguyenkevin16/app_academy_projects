import * as APIUtil from '../utils/step_api_util';
import { receiveErrors, clearErrors } from './error_actions';

export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";

export const receiveSteps = steps => ({
  type: RECEIVE_STEPS,
  steps
});

export const receiveStep = step => ({
  type: RECEIVE_STEP,
  step
});

export const removeStep = step => ({
  type: REMOVE_STEP,
  step
});

export const fetchSteps = () => dispatch => (
  APIUtil.fetchSteps().then(steps => dispatch(receiveSteps(steps)))
);

export const createStep = (step) => dispatch => (
  APIUtil.createStep(step)
    .then(newStep => dispatch(receiveStep(newStep)))
    .then(res => dispatch(clearErrors()))
    .fail(err => dispatch(receiveErrors(err.responseJSON)))
);

export const updateStep = (step) => dispatch => (
  APIUtil.updateStep(step)
    .then(newStep => dispatch(receiveStep(newStep)))
    .then(res => dispatch(clearErrors()))
    .fail(err => dispatch(receiveErrors(err.responseJSON)))
);

export const deleteStep = (step) => dispatch => (
  APIUtil.deleteStep(step)
    .then(newStep => dispatch(removeStep(newStep)))
    .then(res => dispatch(clearErrors()))
    .fail(err => dispatch(receiveErrors(err.responseJSON)))
);

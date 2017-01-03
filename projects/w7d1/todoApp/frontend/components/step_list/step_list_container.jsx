import React from 'react';
import { connect } from 'react-redux';

import StepList from './step_list';
import { receiveStep } from '../../actions/step_actions';

const mapStateToProps = ({steps, todo_id}) => ({
  steps,
  todo_id
});

const mapDispatchToProps = dispatch => ({
  receiveStep: (step) => dispatch(receiveStep(step))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);

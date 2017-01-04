import React from 'react';
import { connect } from 'react-redux';

import StepListItem from './step_list_item';
import { receiveStep,
         removeStep,
         updateStep } from '../../actions/step_actions';

const mapDispatchToProps = dispatch => ({
  receiveStep: (step) => dispatch(receiveStep(step)),
  removeStep: (step) => dispatch(removeStep(step)),
  updateStep: (step) => dispatch(updateStep(step))
});

export default connect(
  null,
  mapDispatchToProps
)(StepListItem);

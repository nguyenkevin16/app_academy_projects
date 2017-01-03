import React from 'react';
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

class StepList extends React.Component {
  render() {
    const { receiveStep, removeStep, updateStep } = this.props;
    return (
      <div>
        <ul>
          <StepListItemContainer />
        </ul>
        <StepForm receiveStep={this.props.receiveStep} />
      </div>
    );
  }
}

export default StepList;

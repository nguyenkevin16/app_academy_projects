import React from 'react';

const StepListItem = ({step, removeStep, updateStep}) => {

  return (
    <div>
      <li>{ step.title }</li>
      <li>{ step.body }</li>
      <button onClick={(updateStep(step))}>
        {step.done === false ? "Done" : "Undo"}
      </button>
      <button onClick={ removeStep(step) }>
        Delete
      </button>
    </div>
  );
};

export default StepListItem;




// const steps = this.props.steps.map((step, i) => (
//   <StepListItem key={i}
//     step={step}
//     removeStep={this.props.removeStep}
//     updateStep={this.props.updateStep} />
// ));

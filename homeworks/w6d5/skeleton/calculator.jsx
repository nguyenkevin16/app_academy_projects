import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "" };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    const value = parseInt(e.target.value);
    if (typeof value === 'number') {
      this.setState({ num1: value });
    } else {
      this.setState({ num1: 0 });
    }
  }

  setNum2(e) {
    e.preventDefault();
    const value = parseInt(e.target.value);
    if (typeof value === 'number') {
      this.setState({ num2: value });
    } else {
      this.setState({ num2: 0 });
    }
  }

  add(e) {
    e.preventDefault();
    this.setState({ result: this.state.num1 + this.state.num2 });
  }

  subtract(e) {
    e.preventDefault();
    this.setState({ result: this.state.num1 - this.state.num2 });
  }

  multiply(e) {
    e.preventDefault();
    this.setState({ result: this.state.num1 * this.state.num2 });
  }

  divide(e) {
    e.preventDefault();
    this.setState({ result: this.state.num1 / this.state.num2 });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ result: 0, num1: "", num2: "" });
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>

        <label>Num 1: </label>
        <input onChange={this.setNum1} value={this.state.num1}></input>

        <br></br>

        <label>Num 2: </label>
        <input onChange={this.setNum2} value={this.state.num2}></input>

        <br></br>

        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>

        <br></br>
        <button onClick={this.clear}>Clear</button>
      </div>
    );
  }
}

export default Calculator;

import React from 'react';
import { Link } from 'react-router';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
   }

  handleSubmit(e) {
    e.peventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user).then(() => this.redirect());
  }

  handleChange(property) {
    return e => {
      e.preventDefault();
      console.log(`${property} : ${e.target.value}`);
      return this.setState({ [property]: e.target.value });
    };
  }

  render() {
    const { loggedIn, formType, errors } = this.props;

    const formHeader = formType === '/login' ? 'Log In' : 'Sign Up';
    const linkHeader = () => {
      if (formType === '/login') {
        return <Link to='/signup'/>;
      } else {
        return <Link to='/login'/>;
      }
    };

    return (
      <form className='session-form' onSubmit={ this.handleSubmit }>
        <h1>{ formHeader }</h1>
        { linkHeader() }

        <input onChange={ this.handleChange('username') }
          value={ this.state.username }
          placeholder='username'/>

        <br/>

        <input onChange={ this.handleChange('password') }
          type='password'
          value={ this.state.password }
          placeholder='password'/>

        <br/>

        <button>Create!</button>
      </form>
    );
  }
}

export default SessionForm;
